/*	file name: userInput_testbench
	Authors: Justin Negron and Richard Osborn
	created: 08/11/21
	team name: POWER_OF_TWO

    tests user Input
*/
`include "gameCommand.svh"

module userInput_testbench();

//inputs
    logic clk;
    logic myTurn = 1;
    logic [2:0] key;

//outputs
    logic resetButtonTimer;
    logic pushedDeal;
    logic cmdReady;
    `gameCommand 	command ;

    userInput dut(clk, myTurn, key, pushedDeal, cmdReady, command);

    //init
    initial begin
        key = 'b111;
    end

//clk
    always
    begin
        #5; clk = 1; #5; clk = 0;
    end

    always 
    begin
        #11
        key = 'b110;
        #10;
        key = 'b111;
        #100;        
    end

//other

endmodule