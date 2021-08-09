/*	file name: gameCommand.svh
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	describes what the DealerAI or the Player choose 
	to do during their turn's action.
*/

//custom signal type
`define gameCommand logic [2:0]
`define COMMAND_NONE 'b000
`define COMMAND_HIT 'b001
`define COMMAND_STAND 'b010
`define COMMAND_DOUBLE 'b011

// typedef enum logic [2:0] 
// 	{
// 		COMMAND_NONE, 
// 		COMMAND_HIT, 
// 		COMMAND_STAND, 
// 		COMMAND_DOUBLE
// 	} gameCommand;
