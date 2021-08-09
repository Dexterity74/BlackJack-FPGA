/*	file name: counter.sv
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	description:
	this is a counter that counts from 0 to TOP. 

	One can read the current VALUE of the counter.

	HITTOP will be asserted for 1 clock cycle.

	enable low will freeze counter in place.
*/

module counter
	#(parameter WIDTH = 16, parameter INCREMENT = 1)
	(
		input	logic	i_clk,	//ticker
		input	logic	i_reset,	//hi means reset
		input	logic 	i_enabled,	//hi means enabled
		input	logic	[WIDTH - 1 : 0]	i_top,

		output	logic	o_hitTop, //asserted for one signal while 
		output	logic	[WIDTH - 1 : 0] o_value
	);

	logic 	hitTop;
	logic [WIDTH - 1 : 0] value;

	initial begin
		hitTop = 0;
		value = 0;
	end

	always @ (posedge i_clk or posedge hitTop or posedge i_reset) 
	begin
		if(i_enabled)
		begin
			if(i_reset || hitTop) 
				value <= 0; 
			else
				value <= value + INCREMENT;//increment counter
		end
		else
			value <= value;
	end

	assign hitTop = (value == i_top);//internal value for feedback

	assign o_hitTop = hitTop;
	assign o_value = value;

endmodule
