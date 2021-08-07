
`include "gameState.svh"

module enumTest_A_testbench
	();

	gameState currentGameState;
	logic out;

	enumTest_A dut(currentGameState, out);

	initial
	currentGameState = S_RESET;

endmodule
