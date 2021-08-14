/*	file name: handController_testbench.sv
	Authors: Justin Negron and Richard Osborn
	created: 08/10/21
	team name: POWER_OF_TWO

    controsl a hand. a hand is an array of cards, and a summed value.

*/

`include "card.svh"
`include "hand.svh"

module handController_testbench
    ();
    //inputs
    logic clk;
    logic reset;
    logic addNewCard;
    `card newCardValue;

    //outputs
    logic [2:0] numberOfCardsInHand;
    `hand handSum;
    `card   card0;
    `card   card1;
    `card   card2;
    `card   card3;
    `card   card4;

    handController dut(clk, reset, addNewCard, 
        newCardValue, handSum, numberOfCardsInHand, 
        card0, card1, card2, card3, card4);

    initial begin
        #1;
        reset = 1;
        addNewCard = 0;
        clk = 0;
        #3;
        reset = 0;
    end

    //clk
    always
    begin
        #5;
        clk = 1;
        #5;
        clk = 0;
    end

    //testing
    always 
    begin
        newCardValue = 'h5;
        #5;
        addNewCard = 1;
        #5;
        addNewCard = 0;
        newCardValue = 'h3;
        #5;
        addNewCard = 1;
        #5;
        
        newCardValue = 'h7;
        #5;
        addNewCard = 1;
        #5;
        addNewCard = 0;
        newCardValue = 'h1;
        #5;
        addNewCard = 1;
        #15;
        reset = 1;
        #5;
        reset = 0;
    end

endmodule
