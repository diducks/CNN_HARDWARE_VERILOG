module max(A,B,E,OUT);
input [31:0] A,B;
output [31:0] OUT;
input E;
wire [31:0] C;

assign C=A-B;
wire [31:0] tempt;
assign tempt = (C[31]==0)? A:B;
assign OUT = E ? tempt : 32'bz;
endmodule