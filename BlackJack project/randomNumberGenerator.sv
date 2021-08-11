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
		//input	logic	i_request,
		input 	logic	[WIDTH - 1 : 0] i_max,

		output 	logic	[WIDTH - 1 : 0] o_value
	);

	//logic resetCounter;
	//logic enableCounter;
	logic hitTop_dummy; //not used by this module, but must be tied to something.
	logic [WIDTH - 1 : 0] counterValue;

	initial begin
		o_value = 0;
	end

	//assign enableCounter = 1;
	//assign resetCounter = 0;

	counter #(WIDTH, 1) cntr (i_clk, i_max, hitTop_dummy, counterValue);

	always_ff @(posedge i_clk)
		begin
			o_value = counterValue;
		end
		


endmodule
