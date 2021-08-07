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

	logic _hitTop; //internal value for feedback

	always @ (posedge i_clk or posedge _hitTop) 
	begin
		if(i_enabled)
		begin
			if(i_reset || _hitTop) 
				o_value <= 0; 
			else
				o_value <= o_value + INCREMENT;//increment counter
		end
		else
			o_value <= o_value;
	end

	assign _hitTop = (o_value == i_top);//internal value for feedback

	assign o_hitTop = _hitTop; //internal value sent out.

endmodule
