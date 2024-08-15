module adder #(parameter DATA_WIDTH = 32) (s,co,cin,a,b); //1 bit dau,31 bit tinh toan => gia tri -2^31...2^31-1
	output [DATA_WIDTH-1:0] s;
	output co;
	input cin;
	input [DATA_WIDTH-1:0] a,b;
	
	wire [DATA_WIDTH-1:0] cout;
	
	assign co = cout[DATA_WIDTH-1];
	genvar i;
	generate
		for(i = 0; i < DATA_WIDTH; i = i+1)
			begin :gen_loop
				if(i == 0) FA ins(a[i],b[i],cin,s[i],cout[i]);// FA(a,b,cin,s,cout);
				else FA ins(a[i],b[i],cout[i-1],s[i],cout[i]);
			end
	endgenerate

endmodule