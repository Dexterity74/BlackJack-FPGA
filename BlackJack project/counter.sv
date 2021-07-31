/*	file name: counter.sv
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO
*/

module counter
	#(parameter WIDTH = 16)
	(
		input	logic	clk,
		input	logic	reset,
		input	logic	[WIDTH - 1 : 0]	top,

		output	logic	hitTop, //asserted for one signal while 
		output	logic	[WIDTH - 1 : 0]	value
	);

	logic _hitTop; //internal value for feedback

	always @ (posedge clk or posedge _hitTop) 
	begin
		if(reset || _hitTop) 
			value <= 0; 
		else
			value <= value + 1;//increment counter

	end

	assign _hitTop = (value == top);//internal value for feedback

	assign hitTop = _hitTop; //internal value sent out.

endmodule
