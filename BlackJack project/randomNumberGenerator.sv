/*	file name: randomNumberGenerator
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	assert request high to get a new random value
*/

module randomNumberGenerator
	#(parameter WIDTH = 4)
	(
		input 	logic	clk,
		input	logic	request,
		input 	logic	[WIDTH - 1 : 0] max,

		output 	logic	[WIDTH - 1 : 0] value
	);

	logic hitTop; //dummy value
	logic resetCounter;
	logic enableCounter;

	assign enableCounter = 1;
	assign resetCounter = 0;

	logic	[WIDTH - 1 : 0] counterValue;
	counter #(WIDTH, 1) counter (clk, resetCounter, enableCounter, 
		max, hitTop, counterValue);

	always @(posedge request)
	begin
		value = counterValue;
	end
endmodule
