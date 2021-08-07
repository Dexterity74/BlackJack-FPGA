/*	file name: dealerAI
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	drive turnIndicator to indicate the AI should make a decision

	dealer stands when hand >= 17;

*/

`include "hand.svh"
`include "gameCommand.svh"

module dealerAI
	(
		input 	logic			turnIndicator,
		input	hand 			handValue,

		output 	gameCommand 	command
	);

	always_comb
	begin
		if(turnIndicator)
		begin	
			if(handValue < 17) command = COMMAND_HIT;
			else command = COMMAND_STAND;
		end
		else command = COMMAND_NONE;
		
	end

	//assign command <= HIT;

endmodule
