/*	file name: userInput
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	the player pushes a button to indicate their choice.

	note that KEYS are high when not pushed and low when they are pushed.
*/
`include "gameCommand.svh"

module userInput
	(
		input	logic			clk,	//unused for now, but can be used to debounce buttons
		input 	logic			turnIndicator,
		input 	logic	[1 : 0]	KEY,

		output 	logic			ready,
		output 	gameCommand 	command
	);

	always_comb
	begin
		if(turnIndicator)
		begin
			if(KEY[1] == 0) command = COMMAND_STAND;
			else if(KEY[0] == 0) command = COMMAND_HIT;
			else command = COMMAND_NONE;
		end
		else command = COMMAND_NONE;
	end

	assign ready = (turnIndicator && !(KEY == 3));//my turn and I pressed a button

endmodule
