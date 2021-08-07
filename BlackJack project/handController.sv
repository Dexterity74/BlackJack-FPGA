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

module handController
    (
        input   logic   i_reset,
        input   logic   i_addNewCard,
        input   card    i_newCard,

        output  hand    o_handSum, //gorgeous
        output  logic [2:0] o_numberOfCardsInHand,
        output  card [4 : 0] o_cards_in_hand
    );

    card [4: 0] cardsInHand;
    hand handSum;
    logic [2:0] cardIndex;

    initial begin
        cardIndex = 'b000;
        handSum = 0;
        for(int i = 0; i < `MAX_CARDS; ++i)
        begin
            cardsInHand[i] = 5'b0;
        end
    end

    always_ff @(posedge i_addNewCard or posedge i_reset)
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
        else
        begin
            cardsInHand[cardIndex] = i_newCard;
            cardIndex = cardIndex + 1;
            handSum = handSum + i_newCard;
        end
    end

    assign o_cardsInHand = cardsInHand;
    assign o_handSum = handSum;
    assign o_numberOfCardsInHand = cardIndex;

endmodule
