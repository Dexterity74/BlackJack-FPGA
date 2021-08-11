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
		//input	logic	i_reset,	//hi means reset
		//input	logic 	i_enabled,	//hi means enabled
		input	logic	[WIDTH - 1 : 0]	i_top,

		output 	logic 					o_hitTop,
		output	logic	[WIDTH - 1 : 0] o_value
	);

	logic [WIDTH - 1 : 0] _value;

	initial 
	begin
		_value = 'd0;
	end

	logic hitTop;

	assign hitTop = _value > i_top;

	always_ff @(posedge i_clk) 
		begin
			if(i_clk)
				begin
					if(hitTop) 
						_value <= 0; 
					else
						_value <= _value + INCREMENT;//increment counter
				end
			else
				_value <= _value;
		end

	assign o_value  = _value;
	assign o_hitTop = hitTop;

endmodule
