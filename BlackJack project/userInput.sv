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
		input 	logic	[2 : 0]	i_KEY,

		output 	logic 			o_dealButtonPushed, //pushed the button to deal a card (different from 'hit')
		output 	logic			o_ready,
		output 	`gameCommand 	o_command
	);

	//button debouncers
	logic buttonDelayReady;
	logic resetButtonTimer;
	logic [13:0] DELAY_MAX = 'd10000; //~0.5 seconds
	//logic [13:0] DELAY_MAX = 'd100; //test
	logic [13:0] delayValue_dummy; //not used

	assign resetButtonTimer = buttonDelayReady 
		&& (~i_KEY[0] | ~i_KEY[1] | ~i_KEY[2]); //any button pushed
	
	counter #(14) buttonDelayCounter(i_clk, resetButtonTimer,
		DELAY_MAX, buttonDelayReady, delayValue_dummy);

	always_comb
	begin
		if(i_turnIndicator)
		begin
			if(buttonDelayReady && i_KEY[1] == 0) o_command = `COMMAND_STAND;
			else if(buttonDelayReady && i_KEY[0] == 0) o_command = `COMMAND_HIT;
			else o_command = `COMMAND_NONE;
		end
		else o_command = `COMMAND_NONE;
	end

	assign o_dealButtonPushed = buttonDelayReady && (~i_KEY[2]);
	assign o_ready = (buttonDelayReady && i_turnIndicator && 
		!(i_KEY[1:0] == 3));//my turn and I pressed a button

endmodule
