/*	file name:
	Authors: Justin Negron and Richard Osborn
	created: 8/04/21
	team name: POWER_OF_TWO

	this guy accepts game variables and translates them to either 7-seg or 
	VGA, our choice.
*/
`include "hand.svh"
`include "gameState.svh"

// make life visually easier
`define SEGMENT_0 6'h0
`define SEGMENT_1 6'h1
`define SEGMENT_2 6'h2
`define SEGMENT_3 6'h3
`define SEGMENT_4 6'h4
`define SEGMENT_5 6'h5
`define SEGMENT_6 6'h6
`define SEGMENT_7 6'h7
`define SEGMENT_8 6'h8
`define SEGMENT_9 6'h9
`define SEGMENT_A 6'hA
`define SEGMENT_B 6'hB
`define SEGMENT_C 6'hC
`define SEGMENT_D 6'hD
`define SEGMENT_E 6'hE
`define SEGMENT_F 6'hF
`define SEGMENT_G 6'h10
`define SEGMENT_H 6'h11
`define SEGMENT_I 6'h12
`define SEGMENT_J 6'h13
`define SEGMENT_K 6'h14
`define SEGMENT_L 6'h15
`define SEGMENT_M 6'h16
`define SEGMENT_N 6'h17
`define SEGMENT_O 6'h18
`define SEGMENT_P 6'h19
`define SEGMENT_Q 6'h1A
`define SEGMENT_R 6'h1B
`define SEGMENT_S 6'h1C
`define SEGMENT_T 6'h1D
`define SEGMENT_U 6'h1E
`define SEGMENT_V 6'h1F
`define SEGMENT_W 6'h20
`define SEGMENT_X 6'h21
`define SEGMENT_Y 6'h22
`define SEGMENT_Z 6'h23
`define SEGMENT_OFF 6'h7F

//`define FLASH_GREEN 8'hFF;
//`define FLASH_RED  18'h3FFFF;

module outputController
	(
		//inputs
		input `hand      dealerHand,
		input `hand      playerHand,
		input `gameState gameState,


		//outputs - will depend on what we are hooking onto
		//output logic [17: 0]   redLights,
		//output logic [7: 0]    greenLights,
		output logic [6: 0]    hex7, 
		output logic [6: 0]    hex6,
		output logic [6: 0]    hex5,  
		output logic [6: 0]    hex4,   // hex3-0 is BLJK, TIE, WIN, LOSE display
		output logic [6: 0]    hex3,
		output logic [6: 0]    hex2,   // hex5-4 is dealer_hand display
		output logic [6: 0]    hex1,
		output logic [6: 0]    hex0   // hex7-6 is player_hand display
	);

	logic [5:0] playerHand7;
	logic [5:0] playerHand6;

	logic [5:0] dealerHand5;
	logic [5:0] dealerHand4;

	logic [5:0] segmLetter3;
	logic [5:0] segmLetter2;
	logic [5:0] segmLetter1;
	logic [5:0] segmLetter0;

	logic [6:0] playerValue7;
	logic [6:0] playerValue6;

	logic [6:0] dealerValue5;
	logic [6:0] dealerValue4;

	logic [6:0] segmValue3;
	logic [6:0] segmValue2;
	logic [6:0] segmValue1;
	logic [6:0] segmValue0;

	//logic [17:0] redLightStatus;
	//logic [7:0]  greenLightStatus;
	
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
					playerHand6 = {1'b0, playerHand};
				end
			else if(playerHand <= 5'd19)
				begin
					//make left 7-seg 1 and right 7-seg playerHand - 10
					playerHand7 = 5'd1;
					playerHand6 = {1'b0, playerHand} - 5'd10;
				end
			else if(playerHand <= 5'd29)
				begin
					//make left 7-seg 2 and right 7-seg playerHand - 20
					playerHand7 = 5'd2;
					playerHand6 = {1'b0, playerHand} - 5'd20;
				end		
			else
				begin //for the 1/100000 chance that the player hits at 20 and gets a 10
					playerHand7 = 5'd3;
					playerHand6 = {1'b0, playerHand} - 5'd30;
				end
		end
	
	// always block for dealer
	always @(dealerHand)
		begin
			if(dealerHand <= 5'd9) 
				begin
					dealerHand5 = 5'd0;
					dealerHand4 = {1'b0, dealerHand};
				end
			else if(dealerHand <= 5'd19)
				begin
					//make left 7-seg 1 and right 7-seg playerHand - 10
					dealerHand5 = 5'd1;
					dealerHand4 = {1'b0, dealerHand} - 5'd10;
				end
			else
				begin
					//make left 7-seg 2 and right 7-seg playerHand - 20
					dealerHand5 = 5'd2;	
					dealerHand4 = {1'b0, dealerHand} - 5'd20;	
				end
		end

	// always block for message box
	always @(gameState)
		begin
			if(gameState == `S_RESET)
				begin
					segmLetter3 = `SEGMENT_S;
					segmLetter2 = `SEGMENT_T;
					segmLetter1 = `SEGMENT_R;
					segmLetter0 = `SEGMENT_T;
				end
			else if(gameState == `S_DEAL_DEALER)
				begin
					segmLetter3 = `SEGMENT_D;
					segmLetter2 = `SEGMENT_E;
					segmLetter1 = `SEGMENT_A;
					segmLetter0 = `SEGMENT_L;
				end
			else if(gameState == `S_RESULT_WIN)
				begin
					segmLetter3 = `SEGMENT_OFF;
					segmLetter2 = `SEGMENT_W;
					segmLetter1 = `SEGMENT_I;
					segmLetter0 = `SEGMENT_N;

				end
		    else if(gameState == `S_RESULT_LOSE)
				begin
					segmLetter3 = `SEGMENT_L;
					segmLetter2 = `SEGMENT_O;
					segmLetter1 = `SEGMENT_S;
					segmLetter0 = `SEGMENT_E;
				end
			else if(gameState == `S_RESULT_TIE)
				begin
					segmLetter3 = `SEGMENT_OFF;
					segmLetter2 = `SEGMENT_T;
					segmLetter1 = `SEGMENT_I;
					segmLetter0 = `SEGMENT_E;
				end
			else
				begin
					segmLetter3 = `SEGMENT_P;
					segmLetter2 = `SEGMENT_L;
					segmLetter1 = `SEGMENT_A;
					segmLetter0 = `SEGMENT_Y;
				end
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

	//assign redLights = redLightStatus
	//assign greenLights = greenLightStatus
	
endmodule


//TODO - VGA connections
//TODO - LCD connections
