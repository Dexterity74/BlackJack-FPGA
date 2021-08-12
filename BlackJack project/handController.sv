/*	file name: handController.sv
	Authors: Justin Negron and Richard Osborn
	created: 08/06/21
	team name: POWER_OF_TWO

    controsl a hand. a hand is an array of cards, and a summed value.

    //5-card Charlie rules
*/

`define ACE_CARD_11 4'd11

`include "card.svh"
`include "hand.svh"

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
        output  `card           o_card0,
        output  `card           o_card1,
        output  `card           o_card2,
        output  `card           o_card3,
        output  `card           o_card4
    );

    `hand handSum;
    `hand handSumAceTest;
    logic [2:0] cardIndex;
    

    initial 
    begin //or just pulse i_reset
        cardIndex = 'b000;
        handSum = 0;
        o_card0 = 0;
        o_card1 = 0;
        o_card2 = 0;
        o_card3 = 0;
        o_card4 = 0;
    end

    always_ff @(posedge i_clk or posedge i_reset)
    begin
        if(i_reset)
        begin
            o_card0 = 0;
            o_card1 = 0;
            o_card2 = 0;
            o_card3 = 0;
            o_card4 = 0;
            handSum = 5'b0;
            cardIndex = 0;
        end
        else if(i_addNewCard)
        begin
            //set new card value and retain old values
            if(cardIndex == 0) o_card0 = i_newCard;
            else    o_card0 = o_card0;
            if(cardIndex == 1) o_card1 = i_newCard;
            else    o_card1 = o_card1;
            if(cardIndex == 2) o_card2 = i_newCard;
            else    o_card2 = o_card2;
            if(cardIndex == 3) o_card3 = i_newCard;
            else    o_card3 = o_card3;
            if(cardIndex == 4) o_card4 = i_newCard;
            else    o_card4 = o_card4;
            cardIndex = cardIndex + 1'b1; //++index

            // Ace card logic
            // if the new card draw is 1, check if 11 added 
            // to the hand will bust the player
            //      if it doesn't bust, add 11 to the hand
            //      if it does bust, add 1 to the hand
            if(i_newCard == 'd1) 
                begin
                    handSumAceTest = handSum;
                    handSumAceTest = handSumAceTest + `ACE_CARD_11;
                    if(handSumAceTest <= 'd21)
                        handSum = handSum + `ACE_CARD_11;
                    else
                        handSum = handSum + i_newCard;
                end
            else
                handSum = handSum + i_newCard;//sum += new card value
        end
        else //retain values
        begin
            o_card0 = o_card0;
            o_card1 = o_card1;
            o_card2 = o_card2;
            o_card3 = o_card3;
            o_card4 = o_card4;
            cardIndex = cardIndex;
            handSum = handSum;
        end
    end

    assign o_handSum = handSum;
    assign o_numberOfCardsInHand = cardIndex;

endmodule
