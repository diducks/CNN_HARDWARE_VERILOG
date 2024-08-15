`timescale 1ns/1ps
module con2d_tb ;				 
								
reg CLK,RST,data_valid_in,load_kernel;
reg [31:0] mem0 [1023:0]; 
reg [31:0] mem1 [24:0]; 
reg [31:0] tempt0 ; 
reg [31:0] tempt1 ;     
wire   [61:0]    data_out;
wire     valid_out; 
wire load_kernel_done;
integer i=1;
integer j=1;
conv2d	INST(.CLK(CLK),
										.RST(RST),
										.data_valid_in(data_valid_in),
										.data_in(tempt0),
										.load_kernel(load_kernel),
										.kernel(tempt1),
										.data_out(data_out),
										.valid_out(valid_out), 
										.load_kernel_done(load_kernel_done));
initial begin 
		CLK=0;
		RST=0;
		data_valid_in=0;
		load_kernel=1;
		tempt0=32'b0;
		tempt1=32'b0;
		#5 RST=1;
		data_valid_in=1;
end
initial begin
  #1250 	load_kernel=0;
end

initial begin
 $readmemh("C:/Users/diduc/OneDrive/Desktop/CNN_CODE/INOUT/anh1.txt",mem0);
 $readmemh("C:/Users/diduc/OneDrive/Desktop/CNN_CODE/INOUT/filter_test.txt",mem1);
end

initial begin
  	tempt0=mem0[0];
	 tempt1=mem0[0];
end

always #50 begin
		tempt0=mem0[i];
		i=i+1;
end
always #50 begin
		tempt1=mem1[j];
		j=j+1;
end
always #25 begin
	CLK=~CLK;

end

endmodule
