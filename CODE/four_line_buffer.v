module four_line_buffer 	#(	parameter DATA_WIDTH = 16,parameter IMG_WIDTH = 28 )(CLK,RST,data_in,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,data_valid_in,valid_out);
input CLK,RST,data_valid_in;
input [DATA_WIDTH-1:0] data_in;
output [DATA_WIDTH-1:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25;

output valid_out;

LINE_BUFFER #(DATA_WIDTH,IMG_WIDTH ) LB1(.CLK(CLK),
																.RST(RST),
																.IN(w25),
																.OUT(w20),
																.E(data_valid_in));
 LINE_BUFFER #(DATA_WIDTH,IMG_WIDTH ) LB2(.CLK(CLK),
																.RST(RST),
																.IN(w20),
																.OUT(w15),
																.E(data_valid_in));
 LINE_BUFFER #(DATA_WIDTH,IMG_WIDTH ) LB3(.CLK(CLK),
																.RST(RST),
																.IN(w15),
																.OUT(w10),
																.E(data_valid_in));																
LINE_BUFFER #(DATA_WIDTH,IMG_WIDTH ) LB4(.CLK(CLK),
																.RST(RST),
																.IN(w10),
																.OUT(w5),
																.E(data_valid_in));

D_FF #(DATA_WIDTH )DFF1 (	.CLK(CLK),
									.RST(RST),
									.IN(data_in),
									.Q(w25),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF2 (	.CLK(CLK),
									.RST(RST),
									.IN(w25),
									.Q(w24),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF3 (	.CLK(CLK),
									.RST(RST),
									.IN(w24),
									.Q(w23),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF4 (	.CLK(CLK),
									.RST(RST),
									.IN(w23),
									.Q(w22),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF5 (	.CLK(CLK),
									.RST(RST),
									.IN(w22),
									.Q(w21),
									.E(data_valid_in));	
D_FF #(DATA_WIDTH )DFF6 (	.CLK(CLK),
									.RST(RST),
									.IN(w20),
									.Q(w19),
									.E(data_valid_in));	
D_FF #(DATA_WIDTH )DFF7 (	.CLK(CLK),
									.RST(RST),
									.IN(w19),
									.Q(w18),
									.E(data_valid_in));	
D_FF #(DATA_WIDTH )DFF8 (	.CLK(CLK),
									.RST(RST),
									.IN(w18),
									.Q(w17),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF9 (	.CLK(CLK),
									.RST(RST),
									.IN(w17),
									.Q(w16),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF10 (	.CLK(CLK),
									.RST(RST),
									.IN(w15),
									.Q(w14),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF11 (	.CLK(CLK),
									.RST(RST),
									.IN(w14),
									.Q(w13),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF12 (	.CLK(CLK),
									.RST(RST),
									.IN(w13),
									.Q(w12),
									.E(data_valid_in));	
D_FF #(DATA_WIDTH )DFF13 (	.CLK(CLK),
									.RST(RST),
									.IN(w12),
									.Q(w11),
									.E(data_valid_in));	
D_FF #(DATA_WIDTH )DFF14 (	.CLK(CLK),
									.RST(RST),
									.IN(w10),
									.Q(w9),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF21 (	.CLK(CLK),
									.RST(RST),
									.IN(w9),
									.Q(w8),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF15 (	.CLK(CLK),
									.RST(RST),
									.IN(w8),
									.Q(w7),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF16 (	.CLK(CLK),
									.RST(RST),
									.IN(w7),
									.Q(w6),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF17 (	.CLK(CLK),
									.RST(RST),
									.IN(w5),
									.Q(w4),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF18 (	.CLK(CLK),
									.RST(RST),
									.IN(w4),
									.Q(w3),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF19 (	.CLK(CLK),
									.RST(RST),
									.IN(w3),
									.Q(w2),
									.E(data_valid_in));	
D_FF #(DATA_WIDTH )DFF20 (	.CLK(CLK),
									.RST(RST),
									.IN(w2),
									.Q(w1),
									.E(data_valid_in));	

//module #(parameter N_CLOCKs = 12) delay_valid(clk,resetn,valid_in,valid_out);

delay_valid #(.N_CLOCKs(IMG_WIDTH*4+5)) valid_ins(CLK,RST,data_valid_in,valid_out);
endmodule 						