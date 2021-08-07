/*	file name: blackjack_testbench
	Authors: Justin Negron and Richard Osborn
	created: 08/06/21
	team name: POWER_OF_TWO

    tests blackjack game
*/

`include "card.svh"
`include "gameCommand.svh"
`include "gameState.svh"
`include "hand.svh"
`include "turnIndicator.svh"

module blackjack_testbench
    ();
    //device inputs
    logic clk;
    logic reset;
    logic key0;
    logic key1;

    //device outputs
    hand playerHand;
    hand dealerHand;
    gameState gameState;
    turnIndicator whoseTurnIsIt;

    blackjackGame dut(clk, reset, {key1, key0}, 
        playerHand, dealerHand, gameState, whoseTurnIsIt);

    always
    begin
        #5; clk = 1; #5; clk = 0;
    end

    initial
    begin
        clk = 0;
        reset = 0;
        key0 = 0;
        key1 = 0;

    end

    // logic [6: 0] hexXOut;
    // logic [6: 0] TIE_T;
    // logic [6: 0] TIE_T;
    // assign TIE_T = 'b100010;


    // logic [6: 0] hex0_internalVariable;
    // logic [6: 0] hex1_internalVariable;

    // logic [3:0] hand;


    // always_comb 
    // begin
    //     if(gameState)
    //         internalVariable = TIE_T;
        
        
    // end

    // assign hexXOut = internalVariable;
    
endmodule
