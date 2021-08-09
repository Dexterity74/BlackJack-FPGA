/*	file name: userInput
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	the player pushes a button to indicate their choice.

	note that i_KEYS are high when not pushed and low when they are pushed.
*/
`include "gameCommand.svh"

module userInput
	(
		input	logic			i_clk,	//unused for now, but can be used to debounce buttons
		input 	logic			i_turnIndicator,
		input 	logic	[1 : 0]	i_KEY,

		output 	logic			o_ready,
		output 	`gameCommand 	o_command
	);

	always_comb
	begin
		if(i_turnIndicator)
		begin
			if(i_KEY[1] == 0) o_command = `COMMAND_STAND;
			else if(i_KEY[0] == 0) o_command = `COMMAND_HIT;
			else o_command = `COMMAND_NONE;
		end
		else o_command = `COMMAND_NONE;
	end

	assign ready = (i_turnIndicator && !(i_KEY == 3));//my turn and I pressed a button

endmodule
