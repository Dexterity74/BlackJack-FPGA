/*	file name: blackjackGame
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO
*/

module blackjackGame
	(
		input  logic 	      clk,
		input  logic 	      reset,
		input  logic 		  hit, stand,
		output logic [17: 0]   redLights,
		output logic [7: 0]    greenLights,
		output logic [6: 0]    hex0, 
		output logic [6: 0]    hex1,
		output logic [6: 0]    hex2,  
		output logic [6: 0]    hex3,   // hex3-0 is BLJK, TIE, WIN, LOSE display
		output logic [6: 0]    hex4,
		output logic [6: 0]    hex5,   // hex5-4 is dealer_hand display
		output logic [6: 0]    hex6,
		output logic [6: 0]    hex7,   // hex7-6 is player_hand display
	);
endmodule