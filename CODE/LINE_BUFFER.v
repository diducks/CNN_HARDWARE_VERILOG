module LINE_BUFFER #(parameter DATA_WIDTH = 16,  parameter IMG_WIDTH = 28) (CLK,RST,IN,OUT,E);
input CLK,RST,E;
input [DATA_WIDTH-1:0] IN;
output [DATA_WIDTH-1:0] OUT;

wire [DATA_WIDTH-1:0] tmp [0:IMG_WIDTH-1];
assign OUT = tmp[IMG_WIDTH-1];

genvar i;
generate
	for (i = 0; i < IMG_WIDTH; i=i+1) begin: DFF
		if(i==0) D_FF#(DATA_WIDTH) D_FF_INS(.CLK(CLK),
														.RST(RST),
														.IN(IN),
														.Q(tmp[i]), 
														.E(E) );
		else 		 D_FF#(DATA_WIDTH) D_FF_INS(.CLK(CLK),
														.RST(RST),
														.IN(tmp[i-1]),
														.Q(tmp[i]),
														.E(E) );
	end
	endgenerate
endmodule