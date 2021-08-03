module counter_testbench();
	logic clk, reset, enabled, hitTop;
	logic [31:0] top, value;

counter dut(clk, reset, enabled, top, hitTop, value);

//generate clock
always
begin
	clk = 'b1; #5; clk = 'b0; #5;
end

initial 
begin
	enabled = 1;
	reset = 1; #1; reset = 0; //toggle reset
	top = -1;
end

endmodule
