module activate # (parameter DATA_WIDTH = 32,parameter ZERO = 0)(in,out); // RELU
	input [DATA_WIDTH -1 :0] in;
	output [DATA_WIDTH -1 :0] out;
	
	assign out = (in[DATA_WIDTH -1])?ZERO:in; // in < 0, out = alpha, in > 0, out = in

endmodule 
