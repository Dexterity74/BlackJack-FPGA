/*	file name: cardDeck.sv
	Authors: Justin Negron and Richard Osborn
	created: 08/06/21
	team name: POWER_OF_TWO

    holds data for a deck of cards
    returns 1 - 10 (1 is ace)

    has no concept of suit

    will need to circle back if we want to draw a King of Clubs.
*/

`include "card.svh"

module cardDeck
    (
        input logic     clk,
        input logic     requestCard,

        output `card     dealtCard
    );

    `card _rngValue;
    logic [3:0] MAX_CARD_VALUE;
    assign MAX_CARD_VALUE = 'd12;

    //modules
    randomNumberGenerator #(4) rng(clk, requestCard, MAX_CARD_VALUE, _rngValue);

    //determine card value from RNG
    always_comb
    begin
        if(requestCard)
            begin
                case(_rngValue)
                    'd10:       dealtCard = 'd10;//jack
                    'd11:       dealtCard = 'd10;//queen
                    'd12:       dealtCard = 'd10;//king

                    //somehow i'm getting 'e' back from the counter, so janky stuff to fake it
                    'd13:       dealtCard = 3;
                    'd14:       dealtCard = 5;
                    'd15:       dealtCard = 7;
                    default:    dealtCard = _rngValue + 1; //0-9 -> 1-10
                endcase 
            end
        else    dealtCard = -1; //invalid card amount
    end

endmodule
