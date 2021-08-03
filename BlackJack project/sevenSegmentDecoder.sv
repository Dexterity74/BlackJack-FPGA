/*	file name:
	Authors: Justin Negron and Richard Osborn
	created: 17/30/21
	team name: POWER_OF_TWO
*/

// WHEN WE CREATE THE WRAPPER, REFER TO HEX LOGIC AS HEX3[0:6], NOT HEX3[6:0]                                                           

module sevenSegDecoder(input  logic [5:0] data,
                	   output logic [6:0] segments);

  always_comb
    case (data)
	 //                      abc_defg
      0:       segments = 7'b000_0001; // 1
      1:       segments = 7'b100_1111; // 0
      2:       segments = 7'b001_0010; // 2
      3:       segments = 7'b000_0110; // 3
      4:       segments = 7'b100_1100; // 4
      5:       segments = 7'b010_0100; // 5
      6:       segments = 7'b010_0000; // 6
      7:       segments = 7'b000_1111; // 7
      8:       segments = 7'b000_0000; // 8
      9:       segments = 7'b000_1100; // 9
	  10:      segments = 7'b000_0010; // a
	  11:      segments = 7'b110_0000; // b
	  12:      segments = 7'b111_0010; // c
	  13:      segments = 7'b100_0010; // d
	  14:      segments = 7'b011_0000; // E
	  15:      segments = 7'b011_1000; // F
	  16:      segments = 7'b010_0001; // G
	  17:      segments = 7'b110_1000; // h
	  18:      segments = 7'b011_1011; // i
	  19:      segments = 7'b010_0111; // j
	  20:      segments = 7'b010_1000; // k
	  21:      segments = 7'b111_0001; // L
	  22:      segments = 7'b010_1010; // M 
	  23:      segments = 7'b110_1010; // n
	  24:      segments = 7'b110_0010; // o
	  25:      segments = 7'b001_1000; // P
	  26:      segments = 7'b000_1100; // q
	  27:      segments = 7'b111_1010; // r
	  28:      segments = 7'b010_0101; // S
	  29:      segments = 7'b111_0000; // t
	  30:      segments = 7'b110_0011; // u
	  31:      segments = 7'b101_0101; // V 
	  32:      segments = 7'b101_0100; // W 
	  33:      segments = 7'b110_1011; // 1
	  34:      segments = 7'b100_0100; // 0
	  35:      segments = 7'b001_0011; // Z
     default:  segments = 7'b111_1111; // no display
	endcase
endmodule