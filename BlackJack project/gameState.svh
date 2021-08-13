/*	file name:
	Authors: Justin Negron and Richard Osborn
	created: 8/04/21
	team name: POWER_OF_TWO

	state enum for blackjack game.
*/

`define gameState logic [4:0]
`define	S_RESET 'b00000					//0x00 
`define	S_DEAL_DEALER 'b00001			//0x01 
`define	S_CHECK_DEALER_BJ 'b00010		//0x02
`define	S_DEALERS_TURN  'b00011			//0x03
`define	S_CHECK_DEALER_BUST  'b000100	//0x04
`define	S_DRAW_TO_17  'b00101			//0x05
`define	S_COMPARE_HANDS  'b00110		//0x06
`define	S_REVEAL_HOLE  'b00111			//0x07
`define	S_DEAL_PLAYER	'b01000			//0x08
`define	S_CHECK_PLAYER_BJ 'b01001		//0x09
`define	S_CHECK_PLAYER_BUST 'b01010		//0x0A
`define	S_PLAYER_CHOICE 'b01011			//0x0B
`define	S_RESULT_TIE	'b01100			//0x0C
`define	S_RESULT_WIN	'b01101			//0x0D
`define	S_RESULT_LOSE	'b01110			//0x0E
`define S_CHECK_PLAYER_5CC 'b01111		//0x0F
`define S_CHECK_DEALER_5CC 'b10000		//0x10
`define S_RESULT_BUST   'b10001         //0x11
`define S_RESULT_BLJK   'b10010         //0x12

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