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

`define HIT_KEY 0
`define STAND_KEY 1
`define DEAL_CARD_KEY 2
`define KEY_STATE_UP 1
`define KEY_STATE_DOWN 0

module blackjack_testbench
    ();
    //device inputs
    logic clk;
    logic reset;
    logic hitKey;
    logic standKey;

    //device outputs
    `hand playerHand;
    `hand dealerHand;
    `gameState gameState;
    `turn whoseTurnIsIt;

    blackjackGame dut(clk, reset, {standKey, hitKey}, 
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
        reset = 0;
        hitKey = `KEY_STATE_UP;
        standKey = `KEY_STATE_UP;
        #1;

        //now test 1 hand

        //deal dealer 1st card
        #5;

        //deal dealer 2nd card 
        #5;

        //check blackjack (most likely not blackjack)
        #5;

        //S_DEALERS_TURN (not)
        #5;

        //deal first card to player
        #5;

        //deal second card to player
        #5;

        //check player bj
        #5; //probably has 4, 5 or something

        //check player bust
        #5;

        //check player 5CC
        #5; //should absolutely be false

        //now wait for player's choice
        #18;

        hitKey = KEY_STATE_DOWN;
        #5;
        hitKey = KEY_STATE_UP;

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

        hitKey = KEY_STATE_DOWN;
        #5;
        hitKey = KEY_STATE_UP;
        
        //now wait for player's choice
        #18;

        hitKey = KEY_STATE_DOWN;
        #5;
        hitKey = KEY_STATE_UP;
        
        //now wait for player's choice
        #18;

        hitKey = KEY_STATE_DOWN;
        #5;
        hitKey = KEY_STATE_UP;
        
        //now wait for player's choice
        #18;

        hitKey = KEY_STATE_DOWN;
        #5;
        hitKey = KEY_STATE_UP;
        
        //now wait for player's choice
        #18;

        hitKey = KEY_STATE_DOWN;
        #5;
        hitKey = KEY_STATE_UP;
        
        //now wait for player's choice
        #18;

        hitKey = KEY_STATE_DOWN;
        #5;
        hitKey = KEY_STATE_UP;

    
    end

    
endmodule
