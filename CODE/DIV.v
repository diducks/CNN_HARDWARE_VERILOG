module DIV(A,B,Q);
input [31:0] A,B;
output [31:0] Q;
wire [31:0] tempt;
assign tempt = A*100;
assign Q=(tempt/B);
endmodule