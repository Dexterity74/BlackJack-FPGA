/*	file name: randomNumberGenerator
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	assert request high to get a new random value
*/

module randomNumberGenerator
	#(parameter WIDTH = 4)
	(
		input 	logic	i_clk,
		input	logic	i_request,
		input 	logic	[WIDTH - 1 : 0] i_max,

		output 	logic	[WIDTH - 1 : 0] o_value
	);

	//logic resetCounter;
	logic enableCounter;

	assign enableCounter = 1;
	//assign resetCounter = 0;

	logic	[WIDTH - 1 : 0] counterValue;
	counter #(WIDTH, 1) cntr (i_clk, enableCounter, 
		i_max, counterValue);

	always_ff @(posedge i_request)
	begin
		o_value = counterValue;
	end
endmodule
