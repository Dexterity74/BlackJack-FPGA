/*	file name: userInput
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	the player pushes a button to indicate their choice.
*/

module userInput
	(
		input 	logic			turnIndicator,
		input 	logic	[1 : 0]	KEY,

		output 	logic			ready,
		output 	gameCommand 	command
	);

	always_comb
	begin
		if(turnIndicator)
		begin
			if(KEY[1] == 0)
			begin
			 	command = STAND;
			 	ready = 1;
	 		end
			else if(KEY[0] == 0) 
			begin
				command = HIT;
				ready = 1;
			end
			else
				command = NONE;
				ready = 0;
		end
		else 
		begin
			ready = 0;
			command = NONE;
		end

	end

endmodule