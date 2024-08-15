module max_4(A,B,C,D,E,OUT);
input [31:0] A,B,C,D;
output [31:0] OUT;
wire [31:0] O1,O2;
input E;
max max1(A,B,E,O1);
max max2(C,D,E,O2);
max max3(O1,O2,E,OUT);

endmodule