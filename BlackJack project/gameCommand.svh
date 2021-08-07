/*	file name: gameCommand.svh
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	describes what the DealerAI or the Player choose 
	to do during their turn's action.
*/

//custom signal type
typedef enum logic [2:0] {COMMAND_NONE, HIT, STAND, DOUBLE} gameCommand;
