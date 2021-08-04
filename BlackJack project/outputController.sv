/*	file name:
	Authors: Justin Negron and Richard Osborn
	created: 8/04/21
	team name: POWER_OF_TWO

	this guy accepts game variables and translates them to either 7-seg or 
	VGA, our choice.
*/
`include "hand.svh"
`include "gameState.svh"

module outputController
	(
		//inputs
		input hand dealerHand,
		input hand playerHand,
		input gameState gameState,

		//outputs - will depend on what we are hooking onto
		output logic x //some filler value.
	);
endmodule


//TODO - 7-seg connections
//TODO - VGA connections
//TODO - LCD connections