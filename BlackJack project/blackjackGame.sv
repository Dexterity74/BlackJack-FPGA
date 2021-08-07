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

module blackjackGame
	(
		input  	logic			i_clk,
		input 	logic			i_reset,
		input 	logic [1 : 0]	i_keyInput,

		output 	hand			o_playerHand,
		output 	hand 			o_dealerHand,
		output 	gameState		o_gameState,
		output 	turnIndicator	o_whoseTurnIsItAnyway			 		
	);

	//internal signals
	logic 	isPlayersTurn;
	logic 	requestCardDraw;
	logic 	isDealersTurn;
	logic 	playerInputReady;

	gameCommand		dealerCommand;
	gameCommand		playerCommand;

	//fsm stuff
	gameState gameState;

	card 	nextCard;
	assign requestCardDraw = (isPlayersTurn || isDealersTurn);

	//turn stuff
	turnIndicator turnTracker;
	assign isPlayersTurn = (turnTracker == TURN_PLAYER);

	assign isDealersTurn = (turnTracker == TURN_DEALER);

	//user input
	//userInput userInput(i_clk, isPlayersTurn, i_keyInput, 
		//playerInputReady, playerCommand);

	//dealer ai

	//card deck
	cardDeck theDeck(i_clk, requestCardDraw, nextCard);

endmodule
