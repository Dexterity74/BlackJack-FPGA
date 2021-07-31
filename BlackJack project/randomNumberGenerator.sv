/*	file name: randomNumberGenerator
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	value behaves like a register
*/

module randomNumberGenerator
	#(parameter WIDTH = 4)
	(
		input 	logic	clk,
		input	logic	request,

		output 	logic	[WIDTH - 1 : 0] value
	);

	logic	[WIDTH - 1 : 0] counterValue;
	counter counter(clk, 0, 1, -1, 0, );

	always_comb
	begin
		if(request)
			value = counterValue;
		else
			value = value;
	end
endmodule
