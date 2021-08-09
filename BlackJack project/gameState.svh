/*	file name:
	Authors: Justin Negron and Richard Osborn
	created: 8/04/21
	team name: POWER_OF_TWO

	state enum for blackjack game.
*/

`define gameState logic [4:0]
`define	S_RESET 'b00000
`define	S_DEAL_DEALER 'b00001
`define	S_CHECK_DEALER_BJ 'b00010
`define	S_DEALERS_TURN  'b00011
`define	S_CHECK_DEALER_BUST  'b000100
`define	S_DRAW_TO_17  'b00101
`define	S_COMPARE_HANDS  'b00110
`define	S_REVEAL_HOLE  'b00111
`define	S_DEAL_PLAYER	'b01000
`define	S_CHECK_PLAYER_BJ 'b01001
`define	S_CHECK_PLAYER_BUST 'b01010
`define	S_PLAYER_CHOICE 'b01011
`define	S_RESULT_TIE	'b01100
`define	S_RESULT_WIN	'b01101
`define	S_RESULT_LOSE	'b01110
`define S_CHECK_PLAYER_5CC 'b01111
`define S_CHECK_DEALER_5CC 'b10000

// typedef enum logic [4:0] 
// {
// 	S_RESET, 
// 	S_DEAL_DEALER, 
// 	S_CHECK_DEALER_BJ, 
// 	S_DEALERS_TURN, 
// 	S_CHECK_DEALER_BUST, 
// 	S_DRAW_TO_17, 
// 	S_COMPARE_HANDS, 
// 	S_REVEAL_HOLE, 
// 	S_DEAL_PLAYER, 
// 	S_CHECK_PLAYER_BJ, 
// 	S_CHECK_PLAYER_BUST, 
// 	S_PLAYER_CHOICE, 
// 	S_RESULT_TIE,
// 	S_RESULT_WIN,
// 	S_RESULT_LOSE
// } gameState;