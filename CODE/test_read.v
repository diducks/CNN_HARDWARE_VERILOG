`timescale 1ns/1ps
module test_read;
reg [31:0] mem [0:31];
reg [31:0] tempt[0:31];
integer i;
initial begin
 $readmemh("C:/Users/diduc/OneDrive/Desktop/CNN_CODE/INOUT/anh_32x32.txt",mem);
end
initial begin
	for (i=0;i<32;i=i+1) begin
		tempt[i]=mem[i];
	end
end
endmodule
