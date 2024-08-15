module delay_clock #(parameter DATA_WIDTH = 8,	parameter N_CLOCKs = 12)(CLK,RST,E,IN,out); // like a shift_register
	
	
	input CLK,RST,E;
	input [DATA_WIDTH-1:0] IN;
	output [DATA_WIDTH-1:0] out;
	
		//Registers for delay n clock(s)
	wire [DATA_WIDTH-1:0] tmp [0 : N_CLOCKs-1];
	
	//assign statement
	assign out = tmp[N_CLOCKs-1];
	
	//Generate instances
genvar i;
generate
	for (i = 0; i < N_CLOCKs; i=i+1) begin: DFF
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
