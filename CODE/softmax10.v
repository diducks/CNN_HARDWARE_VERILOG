module softmax10(IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7,IN8,IN9,P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,s9);
input [31:0] IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7,IN8,IN9;
output [31:0]P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,s9;

wire [31:0] E0,E1,E2,E3,E4,E5,E6,E7,E8,E9;

//exp Exp0(IN0,E0);
//exp Exp1(IN1,E1);
//exp Exp2(IN2,E2);
//exp Exp3(IN3,E3);
//exp Exp4(IN4,E4);
//exp Exp5(IN5,E5);
//exp Exp6(IN6,E6);
//exp Exp7(IN7,E7);
//exp Exp8(IN8,E8);
//exp Exp9(IN9,E9);
assign E0=2**IN0;
assign E1=2**IN1;
assign E2=2**IN2;
assign E3=2**IN3;
assign E4=2**IN4;
assign E5=2**IN5;
assign E6=2**IN6;
assign E7=2**IN7;
assign E8=2**IN8;
assign E9=2**IN9;

wire [31:0] s0,s1,s2,s3,s4,s5,s6,s7,s8,s9;
adder #( .DATA_WIDTH(32) ) add1(.s(s0),.co(),.cin(0),.a(E0),.b(E1));
adder #( .DATA_WIDTH(32) ) add2(.s(s1),.co(),.cin(0),.a(s0),.b(E2));
adder #( .DATA_WIDTH(32) ) add3(.s(s2),.co(),.cin(0),.a(s1),.b(E3));
adder #( .DATA_WIDTH(32) ) add4(.s(s3),.co(),.cin(0),.a(s2),.b(E4));
adder #( .DATA_WIDTH(32) ) add5(.s(s4),.co(),.cin(0),.a(s3),.b(E5));
adder #( .DATA_WIDTH(32) ) add6(.s(s5),.co(),.cin(0),.a(s4),.b(E6));
adder #( .DATA_WIDTH(32) ) add7(.s(s6),.co(),.cin(0),.a(s5),.b(E7));
adder #( .DATA_WIDTH(32) ) add8(.s(s7),.co(),.cin(0),.a(s6),.b(E8));
adder #( .DATA_WIDTH(32) ) add9(.s(s8),.co(),.cin(0),.a(s7),.b(E9));
adder #( .DATA_WIDTH(32) ) add10(.s(s9),.co(),.cin(0),.a(s7),.b(E9));

DIV DIV0(E0,s9,P0);
DIV DIV1(E1,s9,P1);
DIV DIV2(E2,s9,P2);
DIV DIV3(E3,s9,P3);
DIV DIV4(E4,s9,P4);
DIV DIV5(E5,s9,P5);
DIV DIV6(E6,s9,P6);
DIV DIV7(E7,s9,P7);
DIV DIV8(E8,s9,P8);
DIV DIV9(E9,s9,P9);

endmodule