module top(
  input clk,
  input rst,
  output reg [7:0] out,
  output reg [6:0] hex1,
  output reg [6:0] hex2
);
  always @(posedge clk) begin
    if (rst) begin
      out <= 8'd1;
    end else begin
      out <= {(out[0] ^ out[2] ^ out[3] ^ out[4]), out[7:1]};
    end
  end
  
  always @(*) begin
    case(out[3:0])
      4'h0: hex1 = 7'b000_0001; // 0
      4'h1: hex1 = 7'b100_1111; // 1
      4'h2: hex1 = 7'b001_0010; // 2
      4'h3: hex1 = 7'b000_0110; // 3
      4'h4: hex1 = 7'b100_1100; // 4
      4'h5: hex1 = 7'b010_0100; // 5
      4'h6: hex1 = 7'b010_0000; // 6
      4'h7: hex1 = 7'b000_1111; // 7
      4'h8: hex1 = 7'b000_0000; // 8
      4'h9: hex1 = 7'b000_0100; // 9
      4'hA: hex1 = 7'b000_1000; // A
      4'hB: hex1 = 7'b110_0000; // b
      4'hC: hex1 = 7'b011_0001; // C 
      4'hD: hex1 = 7'b100_0010; // d
      4'hE: hex1 = 7'b011_0000; // E
      4'hF: hex1 = 7'b011_1000; // F
    endcase
    case(out[7:4])
      4'h0: hex2 = 7'b000_0001; // 0
      4'h1: hex2 = 7'b100_1111; // 1
      4'h2: hex2 = 7'b001_0010; // 2
      4'h3: hex2 = 7'b000_0110; // 3
      4'h4: hex2 = 7'b100_1100; // 4
      4'h5: hex2 = 7'b010_0100; // 5 
      4'h6: hex2 = 7'b010_0000; // 6
      4'h7: hex2 = 7'b000_1111; // 7
      4'h8: hex2 = 7'b000_0000; // 8
      4'h9: hex2 = 7'b000_0100; // 9
      4'hA: hex2 = 7'b000_1000; // A
      4'hB: hex2 = 7'b110_0000; // b
      4'hC: hex2 = 7'b011_0001; // C 
      4'hD: hex2 = 7'b100_0010; // d
      4'hE: hex2 = 7'b011_0000; // E
      4'hF: hex2 = 7'b011_1000; // F
    endcase
  end
endmodule
