/*	file name:
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO
*/

module blackjack_wrapper
	(	
		input  	logic       	CLOCK_50,
      	input  	logic [17: 0] 	SW,
		input 	logic [3: 0] 	KEY,
		output 	logic [17: 0] 	LEDR,
		output 	logic [7: 0] 	LEDG,
		output 	logic [6: 0]	HEX0,
		output 	logic [6: 0]	HEX1,
		output 	logic [6: 0]	HEX2,
		output 	logic [6: 0]	HEX3,
		output 	logic [6: 0]	HEX4,
		output 	logic [6: 0]	HEX5,
		output 	logic [6: 0]	HEX6,
		output 	logic [6: 0]	HEX7
	);

	//TODO: fill in interface
	//blackjackGame theGame(CLOCK_50);

	//all unused pins should be driven low (off)

endmodule