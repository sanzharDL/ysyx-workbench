module top(
  input [7:0] in,
  output reg en,
  output reg [2:0] out,
  output reg [6:0] seg
);
  always @(*) begin
    casez (in)
      8'b00000001: {en, out} = {1'b1, 3'b000};
      8'b0000001?: {en, out} = {1'b1, 3'b001};
      8'b000001??: {en, out} = {1'b1, 3'b010};
      8'b00001???: {en, out} = {1'b1, 3'b011};
      8'b0001????: {en, out} = {1'b1, 3'b100};
      8'b001?????: {en, out} = {1'b1, 3'b101};
      8'b01??????: {en, out} = {1'b1, 3'b110};
      8'b1???????: {en, out} = {1'b1, 3'b111};
      default:     {en, out} = {1'b0, 3'b000};
    endcase
    
    case (out)
      3'h0: seg = 7'b000_0001; // 0
      3'h1: seg = 7'b100_1111; // 1
      3'h2: seg = 7'b001_0010; // 2
      3'h3: seg = 7'b000_0110; // 3
      3'h4: seg = 7'b100_1100; // 4
      3'h5: seg = 7'b010_0100; // 5 
      3'h6: seg = 7'b010_0000; // 6
      3'h7: seg = 7'b000_1111; // 7
      default: seg = 7'b111_1111;
    endcase
  end

endmodule
