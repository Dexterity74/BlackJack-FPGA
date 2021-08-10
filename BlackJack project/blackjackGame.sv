/*	file name: blackjackGame
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

TODO - 

-------these 3 things are often needed/passed together
---consider making a struct data type!
--this might be superfluous. we can get by without it.
struct handInfo
    hand    handSum, //gorgeous
    logic [2:0] numberOfCardsInHand,
    card [4 : 0] cards_in_hand



---State machine stuff
-------next state
------- outputs are already handled, so needs to affect internal signals
(like whose turn it is)

-----output module rigged (created, needs rigging)

-----blackjack logic (detected, but result needs reading)

-----5-card charlie logic (created, results need reading)
		(needs states added to gameState.svh)
-----only show 1 card for dealer until dealer's turn.


------fix potential timing issue with drawing a card and adding it to hand at the same time
--maybe we'll get lucky and it'll add the last card drawn and add a new card (same end result)
*/

`include "card.svh"
`include "gameCommand.svh"
`include "gameState.svh"
`include "hand.svh"
`include "turnIndicator.svh"

//`define DEALER_HOLE_CARD 0;

module blackjackGame
	(
		input  	logic			i_clk,
		input 	logic			i_reset,
		input 	logic [1 : 0]	i_keyInput,

		//TODO - output other hand info as well for more detailed readout (each card)
		output 	`hand			o_playerHandSum,	
		output 	`hand 			o_dealerHandSum,	
		output 	`gameState		o_gameState,
		output 	`turn			o_whoseTurnIsItAnyway		 		
	);

	//internal signals
	logic 	isPlayersTurn;
	logic 	playerRequestDrawCard;
	logic 	dealerRequestDrawCard;
	logic 	requestCardFromDeck; //dealer || player request
	logic 	isDealersTurn;
	logic 	playerInputReady;

	//---------hand results---------
	//blackjack
	logic 	dealerHasBlackjack;
	logic 	playerHasBlackjack;

	//5-card charlie
	logic 	dealerHasCharlie;
	logic 	playerHasCharlie;

	//bust
	logic 	dealerBusted;
	logic	playerBusted;
	
	//---------Hand Info------------
	//player hand info
	`hand	playerHandSum; //sum
	logic 	[2:0] 		playerCardCount; //quantity
	`card 	playerHand0; //array of 5 cards
	`card 	playerHand1;
	`card 	playerHand2;
	`card 	playerHand3;
	`card 	playerHand4;

	//dealer hand info
	`hand	dealerHandSum;	//sum
	logic 	[2:0] 		dealerCardCount; //quantity
	`card 	dealerHand0; //array of 5 cards
	`card 	dealerHand1;
	`card 	dealerHand2;
	`card 	dealerHand3;
	`card 	dealerHand4;

	`gameCommand	dealerCommand;
	`gameCommand	playerCommand;

	`turn turnTracker;

	//fsm stuff
	`gameState gameState, nextstate;

	`card 	nextCard; //to be given to either player or dealer hands

	//internal signal assignments
	assign playerRequestDrawCard = (isPlayersTurn 
		&& playerCommand == `COMMAND_HIT && gameState == `S_DEAL_PLAYER);
	assign dealerRequestDrawCard = (isDealersTurn 
		&& dealerCommand == `COMMAND_HIT 
		&& (gameState == `S_DEAL_DEALER || gameState == `S_DRAW_TO_17));

	//turn stuff
	assign isPlayersTurn = (turnTracker == `TURN_PLAYER);
	assign isDealersTurn = (turnTracker == `TURN_DEALER);

	assign requestCardFromDeck = (playerRequestDrawCard 
		|| dealerRequestDrawCard);

	//bust detectors
	assign dealerBusted = dealerHandSum > 'd21;
	assign playerBusted = playerHandSum > 'd21;

	//blackjack detectors
    assign dealerHasBlackjack = dealerCardCount == 'd2 
		&& (dealerHandSum == 'd21);
    assign playerHasBlackjack = playerCardCount == 'd2 
		&& (playerHandSum == 'd21);
	
	//5-card charlie detectors
    assign dealerHasCharlie = dealerCardCount == 'd5 
		&& (dealerHandSum <= 'd21);
    assign playerHasCharlie = playerCardCount == 'd5 
		&& (playerHandSum <= 'd21);

	//hands full of cards
	handController playerHandController(i_clk, i_reset, 
		playerRequestDrawCard, nextCard, 
		playerHandSum, playerCardCount,
		playerHand0, playerHand1, playerHand2, playerHand3, playerHand4);
		
	//hands full of cards
	handController dealerHandController(i_clk, i_reset, 
		dealerRequestDrawCard, nextCard, 
		dealerHandSum, dealerCardCount, dealerHand0,
		dealerHand1, dealerHand2, dealerHand3, dealerHand4);

	//user input
	userInput userInput(i_clk, isPlayersTurn, i_keyInput, 
		playerInputReady, playerCommand);

	//dealer ai
	dealerAI dealerAI(isDealersTurn, dealerHandSum, dealerCommand);

	//card deck
	cardDeck theDeck(i_clk, requestCardFromDeck, nextCard);

	always_ff @(posedge i_clk, posedge i_reset)
		if (i_reset) gameState <= `S_RESET;
		else         gameState <= nextstate;

	always_comb 
		case (gameState)
			`S_RESET:             		                   					nextstate = `S_DEAL_DEALER;
			`S_DEAL_DEALER:       if(dealerCardCount < 'd2) 				nextstate = `S_DEAL_DEALER;
			                    	else 				   					nextstate = `S_CHECK_DEALER_BJ;
		    `S_CHECK_DEALER_BJ:   if(dealerHasBlackjack)    				nextstate = `S_RESULT_LOSE;	
							    	else				   					nextstate = `S_DEAL_PLAYER;
			`S_DEAL_PLAYER:       if(playerCardCount < 'd2) 				nextstate = `S_DEAL_PLAYER;
							     	else                   					nextstate = `S_CHECK_PLAYER_BJ;
			`S_CHECK_PLAYER_BJ:   if(playerHasBlackjack)    				nextstate = `S_RESULT_WIN;
							     	else				   					nextstate = `S_CHECK_PLAYER_BUST;
			`S_CHECK_PLAYER_BUST: if(playerBusted)          				nextstate = `S_RESULT_LOSE;
								 	else                   					nextstate = `S_CHECK_PLAYER_5CC;
		    `S_CHECK_PLAYER_5CC:  if(playerHasCharlie)      				nextstate = `S_RESULT_WIN;
									else                   					nextstate = `S_PLAYER_CHOICE;
		    `S_PLAYER_CHOICE:     if(playerRequestDrawCard) 				nextstate = `S_DEAL_PLAYER;
									else if(playerCommand == `COMMAND_NONE) nextstate = `S_PLAYER_CHOICE;
									else                   					nextstate = `S_DRAW_TO_17;
		    `S_DRAW_TO_17:    	  if(dealerHandSum < 17
									&& dealerCardCount < 5)   				nextstate = `S_DRAW_TO_17;
									else                   					nextstate = `S_CHECK_DEALER_BUST;
			`S_CHECK_DEALER_BUST: if(dealerBusted)          				nextstate = `S_RESULT_WIN;
									else                   					nextstate = `S_CHECK_DEALER_5CC;
		    `S_CHECK_DEALER_5CC:  if(dealerHasCharlie)      				nextstate = `S_RESULT_LOSE;
									else                   					nextstate = `S_COMPARE_HANDS;
			`S_COMPARE_HANDS:     if(dealerHandSum == playerHandSum) 		nextstate = `S_RESULT_TIE;
								    else if(dealerHandSum < playerHandSum) 	nextstate = `S_RESULT_WIN;
								    else  								    nextstate = `S_RESULT_LOSE;
			`S_RESULT_LOSE:								 					nextstate = `S_RESET;
			`S_RESULT_TIE:								 					nextstate = `S_RESET;
			`S_RESULT_WIN:								 					nextstate = `S_RESET;
			default:														nextState = `S_RESET;
		endcase


	//turn stuff
	always_comb 
		case(gameState)
			//player phases
			`S_PLAYER_CHOICE:	 	turnTracker = `TURN_PLAYER;
			`S_CHECK_PLAYER_5CC:	turnTracker = `TURN_PLAYER;
			`S_CHECK_PLAYER_BUST:	turnTracker = `TURN_PLAYER;
			`S_CHECK_PLAYER_BJ:		turnTracker = `TURN_PLAYER;
			`S_DEAL_PLAYER:			turnTracker = `TURN_PLAYER;

			//dealer's turn
			`S_CHECK_DEALER_5CC:	turnTracker = `TURN_DEALER;
			`S_CHECK_DEALER_BUST:	turnTracker = `TURN_DEALER;
			`S_CHECK_DEALER_BJ:		turnTracker = `TURN_DEALER;
			`S_DRAW_TO_17: 			turnTracker = `TURN_DEALER;
			`S_DEAL_DEALER:			turnTracker = `TURN_DEALER;
			
			//internal idle turn
			default: turnTracker = `TURN_NONE;
		endcase

	//assign output signals
	assign o_dealerHandSum = dealerHandSum;
	assign o_playerHandSum = playerHandSum;
	assign o_whoseTurnIsItAnyway = turnTracker;
	assign o_gameState = gameState;

endmodule
