
`include "gameState.svh"

module enumTest_A
	(
		input gameState myGameState,

		output logic a
	);

	assign a = myGameState == S_RESET;

endmodule
