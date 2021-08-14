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

`define HIT 0
`define STAND 1
`define DEAL 2
`define KEY_STATE_UP 1
`define KEY_STATE_DOWN 0

module blackjack_testbench
    ();
    //device inputs
    logic clk;
    logic reset;
    logic [3:0] KEY;

    //device outputs
    `hand playerHandSum;
    `hand dealerHandSum;
    `gameState gameState;
    `turn whoseTurnIsIt;

    blackjackGame dut(clk, reset, KEY, 
        playerHandSum, dealerHandSum, gameState, whoseTurnIsIt);

    always
    begin
        #5; clk = 1; #5; clk = 0;
    end

    initial
    begin
        //initialize
        #1;
        clk = 0;
        reset = 1;
        KEY = 'B111; //UP
        #1;

        reset = 0;
        #3;

        //now test 1 hand

        //deal dealer 1st card
        
        KEY[`DEAL] = `KEY_STATE_DOWN;
        #110;
        KEY[`DEAL] = `KEY_STATE_UP;
        #5;

        //deal dealer 2nd card 
        KEY[`DEAL] = `KEY_STATE_DOWN;
        #110;
        KEY[`DEAL] = `KEY_STATE_UP;
        #5;

        //check blackjack (most likely not blackjack)
        #5;
        
        //deal dealer 2nd card 
        KEY[`DEAL] = `KEY_STATE_DOWN;
        #110;
        KEY[`DEAL] = `KEY_STATE_UP;
        #5;

        //deal dealer 2nd card 
        KEY[`DEAL] = `KEY_STATE_DOWN;
        #110;
        KEY[`DEAL] = `KEY_STATE_UP;
        #5;

        //check bj
        #5;

        
        //check bust
        #5;

        
        //check charlie
        #5;

        //deal first card to player
        KEY[`HIT] = `KEY_STATE_DOWN;
        #110;
        KEY[`HIT] = `KEY_STATE_UP;
        #5;

        //deal second card to player
        KEY[`HIT] = `KEY_STATE_DOWN;
        #110;
        KEY[`HIT] = `KEY_STATE_UP;
        #5;

        //check player bj
        #5; //probably has 4, 5 or something

        //check player bust
        #5;

        //check player 5CC
        #5; //should absolutely be false

        //now wait for player's choice
        #15;

        //deal second card to player
        KEY[`HIT] = `KEY_STATE_DOWN;
        #110;
        KEY[`HIT] = `KEY_STATE_UP;
        #5;
        
        //deal second card to player
        KEY[`STAND] = `KEY_STATE_DOWN;
        #110;
        KEY[`STAND] = `KEY_STATE_UP;
        #5;

        //S-Deal_player card
        #5;

        //check bj
        #5;

        //check bust
        #5;

        //check charlie
        #5;

        //wait on input again (try to bust or charlie)
        
        //now wait for player's choice
        #18;

        KEY[`HIT] = `KEY_STATE_DOWN;
        #500;

    
    end

    
endmodule
