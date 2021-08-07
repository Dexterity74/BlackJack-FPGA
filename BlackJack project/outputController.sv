/*	file name:
	Authors: Justin Negron and Richard Osborn
	created: 8/04/21
	team name: POWER_OF_TWO

	this guy accepts game variables and translates them to either 7-seg or 
	VGA, our choice.
*/
`include "hand.svh"
`include "gameState.svh"

module outputController
	(
		//inputs
		input hand      dealerHand,
		input hand      playerHand,
		input gameState gameState,


		//outputs - will depend on what we are hooking onto
		output logic x, //some filler value.
		output logic [17: 0]   redLights,
		output logic [7: 0]    greenLights,
		output logic [6: 0]    hex0, 
		output logic [6: 0]    hex1,
		output logic [6: 0]    hex2,  
		output logic [6: 0]    hex3,   // hex3-0 is BLJK, TIE, WIN, LOSE display
		output logic [6: 0]    hex4,
		output logic [6: 0]    hex5,   // hex5-4 is dealer_hand display
		output logic [6: 0]    hex6,
		output logic [6: 0]    hex7   // hex7-6 is player_hand display
	);

	logic [4:0] playerHand7;
	logic [4:0] playerHand6;

	logic [4:0] dealerHand5;
	logic [4:0] dealerHand4;

	logic [4:0] segmLetter3;
	logic [4:0] segmLetter2;
	logic [4:0] segmLetter1;
	logic [4:0] segmLetter0;

	logic [4:0] temp;
	logic [4:0] temp2;

	sevenSegmentDecoder segDisplayPlayer7(playerHand7, playerValue7);
	sevenSegmentDecoder segDisplayPlayer6(playerHand6, playerValue6);
	sevenSegmentDecoder segDisplayDealer5(dealerHand5, dealerValue5);
	sevenSegmentDecoder segDisplayDealer4(dealerHand4, dealerValue4);
	sevenSegmentDecoder segDisplayMessage3(segmLetter3, segmValue3);
	sevenSegmentDecoder segDisplayMessage2(segmLetter2, segmValue2);
	sevenSegmentDecoder segDisplayMessage1(segmLetter1, segmValue1);
	sevenSegmentDecoder segDisplayMessage0(segmLetter0, segmValue0);

	// always block for player
	always @(playerHand)
		begin
			if(playerHand <= 5'd9)
				begin
					playerHand7 = 5'd0;
					playerHand6 = playerHand;
				end
			else if(playerHand <= 5'd20)
				begin
					//make left 7-seg 1 and right 7-seg playerHand - 10
					playerHand7 = 5'd1;
					temp = playerHand - 5'd10;
					playerHand6 = temp;
				end
			else
				begin
					//make left 7-seg 2 and right 7-seg playerHand - 20
					playerHand7 = 5'd2;
					temp = playerHand - 5'd20;
					playerHand6 = temp;
				end		
		end
	
	// always block for dealer
	always @(dealerHand)
		begin
			if(dealerHand <= 5'd9) 
				begin
					dealerHand5 = 5'd0;
					dealerHand4 = dealerHand;
				end
			else if(dealerHand <= 5'd20)
				begin
					//make left 7-seg 1 and right 7-seg playerHand - 10
					dealerHand5 = 5'd1;
					temp2 = dealerHand - 5'd10;
					dealerHand4 = temp2;
				end
			else
				begin
					//make left 7-seg 2 and right 7-seg playerHand - 20
					dealerHand5 = 5'd2;	
					temp2 = dealerHand - 5'd20;
					dealerHand4 = temp2;	
				end
		end

	// always block for message box
	always @(gameState)
		begin
			if(gameState == S_RESET)
				begin
					segmLetter3 = 5'd28;
					segmLetter2 = 5'd29;
					segmLetter1 = 5'd27;
					segmLetter0 = 5'd29;
				end
			//else if(gameState == )

			//else if(something else)

			//else if(something else)

			//else if(something else)

			//else

		end

	//output logic

	// players hand
	assign hex7 = playerValue7;
	assign hex6 = playerValue6;

	// dealers hand
	assign hex5 = dealerValue5;
	assign hex4 = dealerValue4;

	// message screen
	assign hex3 = segmValue3;
	assign hex2 = segmValue2;
	assign hex1 = segmValue1;
	assign hex0 = segmValue0;
	
	
endmodule


//TODO - 7-seg connections
//TODO - VGA connections
//TODO - LCD connections