module test #(parameter DATA_WIDTH=32,IMG_WIDTH=32) (CLK,RST_N,count_r,E,E_c,E_r,data_valid_in,DATA_IN,DATA_MAX,a0,a1,a2,a3,count_valid);
input CLK,RST_N,data_valid_in;
input [31:0] DATA_IN;
output [31:0] DATA_MAX;
output reg [31:0] count_r,count_valid;
output E;
output reg E_c,E_r;

always @(posedge CLK or negedge RST_N) begin
	if(RST_N==1'b0) begin
		count_valid=1'b0;
	end
	else if(count_valid < IMG_WIDTH+1) count_valid=count_valid+1;
	else begin 
		count_valid=count_valid;
	end
end

always @(posedge CLK or negedge RST_N) begin
	if(RST_N==1'b0) begin
		E_c=1'b0;
	end
	else if(count_valid==IMG_WIDTH+1) E_c=~E_c;
	else E_c=E_c;
end
always @(posedge CLK or negedge RST_N) begin
	if(RST_N==1'b0) begin 
		count_r = 32'b1;
		E_r=1'b1;
	end
	else if(count_r < 31 && count_valid==IMG_WIDTH+1) count_r=count_r+1;
	else if(count_r >= 31 && count_valid==IMG_WIDTH+1) 
		begin 
			count_r=0;
			E_r=~E_r;
		end
	else E_r=E_r;
end
assign E=(E_c && E_r)?1'b1:1'b0;
output [31:0] a0,a1,a2,a3;
LINE_BUFFER #(DATA_WIDTH,IMG_WIDTH ) LB1(.CLK(CLK),
																.RST(RST_N),
																.IN(a0),
																.OUT(a2),
																.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF1 (	.CLK(CLK),
									.RST(RST_N),
									.IN(DATA_IN),
									.Q(a0),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF2 (	.CLK(CLK),
									.RST(RST_N),
									.IN(a0),
									.Q(a1),
									.E(data_valid_in));
D_FF #(DATA_WIDTH )DFF3 (	.CLK(CLK),
									.RST(RST_N),
									.IN(a2),
									.Q(a3),
									.E(data_valid_in));
max_4 max(.A(a0),.B(a1),.C(a2),.D(a3),.E(E),.OUT(DATA_MAX));

endmodule

