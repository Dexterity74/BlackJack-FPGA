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

        output card     dealtCard
    );

    card _rngValue;

    //modules
    randomNumberGenerator #(4) rng(clk, requestCard, 'h12, _rngValue);

    //determine card value from RNG
    always_comb
    begin
        if(requestCard)
        begin
            case(_rngValue)
                'h10:       dealtCard = 'hA;//jack
                'h11:       dealtCard = 'hA;//queen
                'h12:       dealtCard = 'hA;//king
                default:    dealtCard = _rngValue + 1; //all else
            endcase 
        end
        else    dealtCard = -1; //invalid card amount
    end

endmodule
