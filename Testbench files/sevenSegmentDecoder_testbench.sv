module testbench_alphabet();
	logic clk, reset;

	logic   [5:0] data;
	logic   [6:0] segments;

	alphabet dut(data, segments);

	// tests segment output through all numbers/letters
	initial 
	  begin
	    reset = 1; #10; reset = 0;
	  end

	always
	  begin
	    clk = 1; #5; clk = 0; #5;
	  end

	always_ff @(posedge clk)
	  if (reset) data <= 0;
	  else       data <= data+1;
	
endmodule