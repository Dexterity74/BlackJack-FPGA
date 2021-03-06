/*	file name: turnIndicator
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	describes whose turn it is.
	NONE -- internal stuff going on 
	Dealer -- dealer's turn to do stuff
	Player -- player's turn to do stuff.
*/

//custom signal type
//typedef enum logic [2:0] {TURN_NONE, TURN_DEALER, TURN_PLAYER} turnIndicator;

`define turn logic [1:0]
`define TURN_NONE 'b00
`define TURN_DEALER 'b01
`define TURN_PLAYER 'b10
