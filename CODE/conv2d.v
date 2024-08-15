module conv2d #(  parameter DATA_WIDTH = 32,  parameter IMG_WIDTH = 32) (
	 input     wire            CLK,
    input     wire            RST,
    input     wire            data_valid_in,
    input     wire   [DATA_WIDTH-1:0]    data_in,
    input     wire            load_kernel,
    input     wire   [31:0]   kernel,    
    output    wire   [61:0]    data_out,
    output     valid_out, 
	 output reg load_kernel_done);
wire [DATA_WIDTH-1:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25;
    reg [31:0] kernelR [0:24];
	 reg [4:0] counter_load;
	 
always @(posedge CLK)
      if (load_kernel)
        kernelR[counter_load] <= kernel;
    
    always @ (posedge CLK or negedge RST) begin
      if(RST == 1'b0) begin
        counter_load <= 4'b0;
      end
      else if (load_kernel == 1'b1) begin
        counter_load <= counter_load + 5'b1;
      end
      else if (load_kernel == 1'b0) begin
        counter_load <= counter_load;
      end
	  end
	always @ (posedge CLK or negedge RST) begin
		if(RST == 1'b0) begin
			load_kernel_done <= 1'b0;
		end
		else if (counter_load == 5'd25) begin
			load_kernel_done <= 1'b1;
		end
		else begin
			load_kernel_done <= load_kernel_done;
		end
	end
	 four_line_buffer #(.DATA_WIDTH(DATA_WIDTH),.IMG_WIDTH(IMG_WIDTH)) 
					four_lbs	  (CLK,
									RST,
									data_in,
									w1,
									w2,
									w3,
									w4,
									w5,
									w6,
									w7,
									w8,
									w9,
									w10,
									w11,
									w12,
									w13,
									w14,
									w15,
									w16,
									w17,
									w18,
									w19,
									w20,
									w21,
									w22,
									w23,
									w24,
									w25,
									data_valid_in,
									valid_out);
wire [61:0] m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,m20,m21,m22,m23,m24;								
mult_24bit mult1(.a(kernelR[0]),.b(w25),.p(m0));
mult_24bit mult2(.a(kernelR[1]),.b(w24),.p(m1));
mult_24bit mult3(.a(kernelR[2]),.b(w23),.p(m2));
mult_24bit mult4(.a(kernelR[3]),.b(w22),.p(m3));
mult_24bit mult5(.a(kernelR[4]),.b(w21),.p(m4));
mult_24bit mult6(.a(kernelR[5]),.b(w20),.p(m5));
mult_24bit mult7(.a(kernelR[6]),.b(w19),.p(m6));
mult_24bit mult8(.a(kernelR[7]),.b(w18),.p(m7));
mult_24bit mult9(.a(kernelR[8]),.b(w17),.p(m8));
mult_24bit mult10(.a(kernelR[9]),.b(w16),.p(m9));
mult_24bit mult11(.a(kernelR[10]),.b(w15),.p(m10));
mult_24bit mult12(.a(kernelR[11]),.b(w14),.p(m11));
mult_24bit mult13(.a(kernelR[12]),.b(w13),.p(m12));
mult_24bit mult14(.a(kernelR[13]),.b(w12),.p(m13));
mult_24bit mult15(.a(kernelR[14]),.b(w11),.p(m14));
mult_24bit mult16(.a(kernelR[15]),.b(w10),.p(m15));
mult_24bit mult17(.a(kernelR[16]),.b(w9),.p(m16));
mult_24bit mult18(.a(kernelR[17]),.b(w8),.p(m17));
mult_24bit mult19(.a(kernelR[18]),.b(w7),.p(m18));
mult_24bit mult20(.a(kernelR[19]),.b(w6),.p(m19));
mult_24bit mult21(.a(kernelR[20]),.b(w5),.p(m20));
mult_24bit mult22(.a(kernelR[21]),.b(w4),.p(m21));
mult_24bit mult23(.a(kernelR[22]),.b(w3),.p(m22));
mult_24bit mult24(.a(kernelR[23]),.b(w2),.p(m23));
mult_24bit mult25(.a(kernelR[24]),.b(w1),.p(m24));

wire [61:0] s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24;
adder #( .DATA_WIDTH(62) ) add1(.s(s0),.co(),.cin(0),.a(m0),.b(m1));
adder #( .DATA_WIDTH(62) ) add2(.s(s1),.co(),.cin(0),.a(s0),.b(m2));
adder #( .DATA_WIDTH(62) ) add3(.s(s2),.co(),.cin(0),.a(s1),.b(m3));
adder #( .DATA_WIDTH(62) ) add4(.s(s3),.co(),.cin(0),.a(s2),.b(m4));
adder #( .DATA_WIDTH(62) ) add5(.s(s4),.co(),.cin(0),.a(s3),.b(m5));
adder #( .DATA_WIDTH(62) ) add6(.s(s5),.co(),.cin(0),.a(s4),.b(m6));
adder #( .DATA_WIDTH(62) ) add7(.s(s6),.co(),.cin(0),.a(s5),.b(m7));
adder #( .DATA_WIDTH(62) ) add8(.s(s7),.co(),.cin(0),.a(s6),.b(m8));
adder #( .DATA_WIDTH(62) ) add9(.s(s8),.co(),.cin(0),.a(s7),.b(m9));
adder #( .DATA_WIDTH(62) ) add10(.s(s9),.co(),.cin(0),.a(s8),.b(m10));
adder #( .DATA_WIDTH(62) ) add11(.s(s10),.co(),.cin(0),.a(s9),.b(m11));
adder #( .DATA_WIDTH(62) ) add12(.s(s11),.co(),.cin(0),.a(s10),.b(m12));
adder #( .DATA_WIDTH(62) ) add13(.s(s12),.co(),.cin(0),.a(s11),.b(m13));
adder #( .DATA_WIDTH(62) ) add14(.s(s13),.co(),.cin(0),.a(s12),.b(m14));
adder #( .DATA_WIDTH(62) ) add15(.s(s14),.co(),.cin(0),.a(s13),.b(m15));
adder #( .DATA_WIDTH(62) ) add16(.s(s15),.co(),.cin(0),.a(s14),.b(m16));
adder #( .DATA_WIDTH(62) ) add17(.s(s16),.co(),.cin(0),.a(s15),.b(m17));
adder #( .DATA_WIDTH(62) ) add18(.s(s17),.co(),.cin(0),.a(s16),.b(m18));
adder #( .DATA_WIDTH(62) ) add19(.s(s18),.co(),.cin(0),.a(s17),.b(m19));
adder #( .DATA_WIDTH(62) ) add20(.s(s19),.co(),.cin(0),.a(s18),.b(m20));
adder #( .DATA_WIDTH(62) ) add21(.s(s20),.co(),.cin(0),.a(s19),.b(m21));
adder #( .DATA_WIDTH(62) ) add22(.s(s21),.co(),.cin(0),.a(s20),.b(m22));
adder #( .DATA_WIDTH(62) ) add23(.s(s22),.co(),.cin(0),.a(s21),.b(m23));
adder #( .DATA_WIDTH(62) ) add24(.s(s23),.co(),.cin(0),.a(s22),.b(m24));
assign data_out=s23;
endmodule