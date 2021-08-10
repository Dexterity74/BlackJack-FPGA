/*	file name: handController.sv
	Authors: Justin Negron and Richard Osborn
	created: 08/06/21
	team name: POWER_OF_TWO

    controsl a hand. a hand is an array of cards, and a summed value.

    //5-card Charlie rules
*/

`include "card.svh"
`include "hand.svh"

`define MAX_CARDS 5
/*TODO - 
struct 
    hand    o_handSum, //gorgeous
    logic [2:0] o_numberOfCardsInHand,
    card [4 : 0] o_cards_in_hand
*/

module handController
    (
        input   logic   i_clk,
        input   logic   i_reset,        //resets on hi
        input   logic   i_addNewCard,
        input   `card   i_newCard,

        output  `hand           o_handSum, //gorgeous
        output  logic [2:0]     o_numberOfCardsInHand,
        output  `card [4 : 0]   o_cardsInHand //array of card values
    );

    `card [4: 0] cardsInHand;
    `hand handSum;
    logic [2:0] cardIndex;

    initial begin //or just pulse i_reset
        cardIndex = 'b000;
        handSum = 0;
        for(int i = 0; i < `MAX_CARDS; ++i)
        begin
            cardsInHand[i] = 5'b0;
        end
    end

    always_ff @(posedge i_clk or posedge i_reset)
    begin
        if(i_reset)
        begin
            for(int i = 0; i < `MAX_CARDS; ++i)
            begin
                cardsInHand[i] = 5'b00000;
            end
            handSum = 5'b0;
            cardIndex = 0;
        end
        else if(i_addNewCard)
        begin
            //set new card value and retain old values
            for(int i = 0; i < `MAX_CARDS; ++i)
            begin
                if(i == cardIndex)
                    cardsInHand[cardIndex] = i_newCard;
                else
                    cardsInHand[i] = cardsInHand[i];
            end
            cardIndex = cardIndex + 1; //++index
            handSum = handSum + i_newCard;//sum += new card value
        end
        else //retain values
        begin
            for(int i = 0; i < `MAX_CARDS; ++i)
            begin
                cardsInHand[i] = cardsInHand[i];
            end
            cardIndex = cardIndex;
            handSum = handSum;
        end
    end

    assign o_cardsInHand = cardsInHand;
    assign o_handSum = handSum;
    assign o_numberOfCardsInHand = cardIndex;

endmodule
