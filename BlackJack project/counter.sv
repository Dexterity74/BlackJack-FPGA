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
		//input	logic 	i_enabled,	//hi means enabled
		input	logic	[WIDTH - 1 : 0]	i_top,

		output 	logic 					o_hitTop,
		output	logic	[WIDTH - 1 : 0] o_value
	);

	logic [WIDTH - 1 : 0] _value;
	logic hitTop;

	initial 
	begin
		_value = 'd0;
	end

	always_ff @(posedge i_clk) 
	begin
		if(i_reset)
		begin
			hitTop = 0;
			_value = 0;
		end
		else
		begin
			if(i_top == _value)
			begin
				hitTop = 1;
				_value = _value; //hold hi until reset
			end
			else
			begin
				hitTop = 0;
				_value = _value + 1;
			end

		end
	end

	assign o_value  = _value;
	assign o_hitTop = hitTop;

endmodule
