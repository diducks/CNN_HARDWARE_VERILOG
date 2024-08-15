module double_line_buffer 	#(	parameter DATA_WIDTH = 16,parameter IMG_WIDTH = 28 )(CLK,RST,data_in,w1,w2,w3,w4,w5,w6,w7,w8,w9,data_valid_in,valid_out);
input CLK,RST,data_valid_in;
input [DATA_WIDTH-1:0] data_in;
output [DATA_WIDTH-1:0] w1;
output [DATA_WIDTH-1:0] w2;
output [DATA_WIDTH-1:0] w3;
output [DATA_WIDTH-1:0] w4;
output [DATA_WIDTH-1:0] w5;
output [DATA_WIDTH-1:0] w6;
output [DATA_WIDTH-1:0] w7; 
output [DATA_WIDTH-1:0] w8;
output [DATA_WIDTH-1:0] w9;
output valid_out;

LINE_BUFFER #(DATA_WIDTH,IMG_WIDTH ) LB1(.CLK(CLK),
																.RST(RST),
																.IN(w9),
																.OUT(w6),
																.E(data_valid_in));
 LINE_BUFFER #(DATA_WIDTH,IMG_WIDTH ) LB2(.CLK(CLK),
																.RST(RST),
																.IN(w6),
																.OUT(w3),
																.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF1 (	.CLK(CLK),
									.RST(RST),
									.IN(w9),
									.Q(w8),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF2 (	.CLK(CLK),
									.RST(RST),
									.IN(w8),
									.Q(w7),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF3 (	.CLK(CLK),
									.RST(RST),
									.IN(w6),
									.Q(w5),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF4 (	.CLK(CLK),
									.RST(RST),
									.IN(w5),
									.Q(w4),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF5 (	.CLK(CLK),
									.RST(RST),
									.IN(w3),
									.Q(w2),
									.E(data_valid_in));	
D_FF #(DATA_WIDTH )DFF6 (	.CLK(CLK),
									.RST(RST),
									.IN(w2),
									.Q(w1),
									.E(data_valid_in));	
D_FF #(DATA_WIDTH )DFF7 (	.CLK(CLK),
									.RST(RST),
									.IN(data_in),
									.Q(w9),
									.E(data_valid_in));	

//module #(parameter N_CLOCKs = 12) delay_valid(clk,resetn,valid_in,valid_out);

delay_valid #(.N_CLOCKs(IMG_WIDTH+1)) valid_ins(CLK,RST,data_valid_in,valid_out);
			endmodule 						