/*	file name:
	Authors: Justin Negron and Richard Osborn
	created: 8/04/21
	team name: POWER_OF_TWO

	state enum for blackjack game.
*/

typedef enum [4:0] 
{
	S_RESET, 
	S_DEAL_DEALER, 
	S_CHECK_DEALER_BJ, 
	S_DEALERS_TURN, 
	S_CHECK_DEALER_BUST, 
	S_DRAW_TO_17, 
	S_COMPARE_HANDS, 
	S_REVEAL_HOLE, 
	S_DEAL_PLAYER, 
	S_CHECK_PLAYER_BJ, 
	S_CHECK_PLAYER_BUST, 
	S_PLAYER_CHOICE, 
	S_RESULT_TIE,
	S_RESULT_WIN,
	S_RESULT_LOSE
} gameState;