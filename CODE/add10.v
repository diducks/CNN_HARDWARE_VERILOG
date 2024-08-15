module add10(m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,s);
input [61:0] m0,m1,m2,m3,m4,m5,m6,m7,m8,m9;
output [61:0] s;

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
assign s=s23;

endmodule
