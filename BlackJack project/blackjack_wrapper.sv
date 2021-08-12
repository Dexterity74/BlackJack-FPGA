/*	file name:
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO
*/

`include "card.svh"
`include "gameCommand.svh"
`include "gameState.svh"
`include "hand.svh"
`include "turnIndicator.svh"

module blackjack_wrapper
	(	
		input  	logic       	CLOCK_50, // clk
      	input  	logic [17: 0] 	SW,		  // reset (limiting to [17] to try and line up input/outputs to blackjackGame.sv)
		input 	logic [3 : 0] 	KEY,      // hit/stand
		output 	logic [17: 0] 	LEDR,     
		output 	logic [8: 0] 	LEDG,
		output 	logic [0: 6]	HEX0,
		output 	logic [0: 6]	HEX1,
		output 	logic [0: 6]	HEX2,
		output 	logic [0: 6]	HEX3,
		output 	logic [0: 6]	HEX4,
		output 	logic [0: 6]	HEX5,
		output 	logic [0: 6]	HEX6,
		output 	logic [0: 6]	HEX7
	);

	`hand	dealerHandSum;	//sum
	`hand	playerHandSum; //sum
	`gameState gameState, nextstate;
	`turn turnTracker;
	
	//all unused pins should be driven low (off)
	assign LEDR = 0;
	assign LEDG = 0;

	//TODO: fill in interface
	blackjackGame theGame(CLOCK_50, SW[17], {KEY[2], KEY[1], KEY[0]}, 
						  playerHandSum, dealerHandSum, gameState, turnTracker); 
	
	outputController oC(dealerHandSum, playerHandSum, gameState, HEX7[0: 6], HEX6[0: 6], HEX5[0: 6], HEX4[0: 6], 
							HEX3[0: 6], HEX2[0: 6], HEX1[0: 6], HEX0[0: 6]);

	// Justin: I don't think switch 17 will be used for gameplay at all so
	//		   it would make good for a reset switch


endmodule
