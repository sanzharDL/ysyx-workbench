module top(
  input [3:0] A,
  input [3:0] B,
  input [2:0] sel,
  output reg [3:0] out
);
  int n = 4;
  wire [3:0] t_add_Cin;
  wire Carry;
  wire [3:0] Result;
  wire Overflow;
  wire Cin = (sel == 3'b001 || sel == 3'b110 || sel == 3'b111) ? 1'b1 : 1'b0;
  assign t_add_Cin =( {4{Cin}}^B )+ Cin;  //  在这里请注意^运算和+运算的顺序
  assign { Carry, Result } = A + t_add_Cin;
  assign Overflow = (A[n-1] == t_add_Cin[n-1]) && (Result [n-1] != A[n-1]);

  always @(*) begin
    case (sel)
      3'b000: out = Result;
      3'b001: out = Result;
      3'b010: out = A ^ {4{1'b1}};
      3'b011: out = A & B;
      3'b100: out = A | B;
      3'b101: out = A ^ B;
      3'b110: out = {3'b0, Result[3] ^ Overflow};
      3'b111: out = {3'b0, Result == 4'd0};
    endcase
  end

endmodule
