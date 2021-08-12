/*	file name: dealerAI
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	describes a hand of cards
	represents the sum of all the cards in the player's hand.
	must cover [0, 30] //worst hand is three 10s.
	2 ^ 5 = 32

	TODO - hand needs to be an array of values that gets summed.
	We need to be able to determine how many ACES are in the hand,
	and we need to hide the dealer's hole card after viewing it.

	MAKE ME A STRUCT!

*/

`define hand logic [4:0]
`define HAND_WIDTH 5
//typedef logic [4 : 0] hand;
