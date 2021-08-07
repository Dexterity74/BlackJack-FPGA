/*	file name: blackjackGame
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO
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

		output 	hand			o_playerHandSum,	
		output 	hand 			o_dealerHandSum,	
		output 	gameState		o_gameState,
		output 	turnIndicator	o_whoseTurnIsItAnyway		 		
	);

	//internal signals
	logic 	isPlayersTurn;
	logic 	playerRequestCardDraw;
	logic 	dealerRequestCardDraw;
	logic 	isDealersTurn;
	logic 	playerInputReady;
	
/*TODO - 
struct 
    hand    o_handSum, //gorgeous
    logic [2:0] o_numberOfCardsInHand,
    card [4 : 0] o_cards_in_hand
*/
	//player hand info
	hand			playerHandSum;
	logic 	[2:0] 	playerCardCount;
	card 	[4:0] 	playerHand;

	//dealer hand info
	hand			dealerHandSum;
	logic 	[2:0] 	dealerCardCount; 
	card 	[4:0] 	dealerHand;

	gameCommand		dealerCommand;
	gameCommand		playerCommand;

	turnIndicator turnTracker;

	//fsm stuff
	gameState gameState;

	card 	nextCard;
	assign playerRequestDrawCard = (isPlayersTurn && playerCommand == COMMAND_HIT);
	assign dealerRequestDrawCard = (isDealersTurn && dealerCommand == COMMAND_HIT);

	//turn stuff
	assign isPlayersTurn = (turnTracker == TURN_PLAYER);
	assign isDealersTurn = (turnTracker == TURN_DEALER);

	//hands full of cards
	handController playerHand(i_reset, 
		playerRequestDrawCard,//TIMING ISSUE HERE! card is not ready yet. maybe wait one clock cycle.
		nextCard, playerHandSum, playerCardCount, playerHand);
		
	//hands full of cards
	handController dealerHand(i_reset, 
		dealerRequestDrawCard,//TIMING ISSUE HERE! card is not ready yet. maybe wait one clock cycle.
		nextCard, dealerHandSum, dealerCardCount, dealerHand);

	//user input
	userInput userInput(i_clk, isPlayersTurn, i_keyInput, 
		playerInputReady, playerCommand);

	//dealer ai

	//card deck
	cardDeck theDeck(i_clk, requestCardDraw, nextCard);

	//assign output signals
	assign o_dealerHandSum = dealerHandSum;
	assign o_playerHandSum = playerHandSum;
	assign o_whoseTurnIsItAnyway = turnTracker;
	assign o_gameState = gameState;

endmodule
