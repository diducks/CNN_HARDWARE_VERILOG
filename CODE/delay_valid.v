module delay_valid #(parameter N_CLOCKs = 12) (clk,resetn,valid_in,valid_out);
	
	
	input clk;
	input resetn;
	
	input valid_in;
	output valid_out;
	
    wire out_valid;
    delay_clock #(.DATA_WIDTH(1),.N_CLOCKs(N_CLOCKs)) valid_inst(clk,resetn,valid_in,valid_in,out_valid);

    assign valid_out = out_valid& valid_in;
	

endmodule
