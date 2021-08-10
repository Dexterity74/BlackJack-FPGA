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
    `HAND_OF_5_CARDS cardsInHand;

    handController dut(clk, reset, addNewCard, 
        newCardValue, handSum, numberOfCardsInHand, 
        cardsInHand);

    initial begin
        #1;
        reset = 1;
        addNewCard = 0;
        clk = 0;
        newCardValue = 0;
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
        #6;
        addNewCard = 1;
        #4;
        addNewCard = 0;
        newCardValue = 'h3;
        #5;
        addNewCard = 1;
        #5;
    end

endmodule
