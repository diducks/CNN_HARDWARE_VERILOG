module truncate #( parameter WIDTH = 28, parameter HEIGHT = 28,parameter KERNEL = 3	)(clk,resetn,valid_in,valid_out,done);
	input clk;
	input resetn;
	input valid_in;
	output valid_out;
	output done;
	
	reg [7:0] count_v,count_h;
	wire [7:0] dim = (KERNEL==3)?8'd1:((KERNEL==5)?8'd2:((KERNEL==7)?8'd3:8'd4));

	always @ (posedge clk or negedge resetn) begin
		if(resetn == 1'b0) count_v <= 8'b0;
		else if(valid_in == 1'b1) begin
			if (count_h == WIDTH-1) begin
				if( count_v == WIDTH-1) count_v <= 8'b0; 
				else if (count_v != WIDTH-1) count_v <= count_v + 8'b1; 
			end
			else if (count_h != WIDTH-1) count_v <= count_v;
		end
		else if (valid_in == 1'b0) begin
			count_v <= count_v;
		end
	end
	always @ (posedge clk or negedge resetn) begin
		if(resetn == 1'b0) count_h <= 8'b0;
		else if (valid_in == 1'b1) begin
				if( count_h == WIDTH-1) count_h <= 8'b0; 
				else if (count_h != WIDTH-1) count_h <= count_h + 8'b1;
			end
		else if (valid_in == 1'b0) begin
				count_h <= count_h;
			end
	end
	
	assign valid_out = (count_h < dim | count_h >= WIDTH-dim | count_v < dim | count_v >= HEIGHT-dim | valid_in == 1'b0)?1'b0:1'b1;
	assign done = (count_h == WIDTH-dim-1 &&  count_v == HEIGHT-dim-1 && valid_out)?1'b1:1'b0;
endmodule