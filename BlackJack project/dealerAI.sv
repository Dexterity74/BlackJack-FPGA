/*	file name: dealerAI
	Authors: Justin Negron and Richard Osborn
	created: 07/30/21
	team name: POWER_OF_TWO

	drive turnIndicator to indicate the AI should make a decision

	dealer stands when hand >= 17;

*/

module dealerAI
	(
		input 	logic			turnIndicator,
		input	logic	[4 : 0] handValue,

		output 	blackjack::gameCommand 	command
	);

	always_comb
	begin
		if(turnIndicator)
		begin	
			if(handValue < 17) command = HIT;
			else if command = STAND;
		end
		else command = NONE;
		
	end

	//assign command <= HIT;

endmodule
