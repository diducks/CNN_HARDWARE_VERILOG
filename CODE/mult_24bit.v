module mult_24bit(a,b,p); // multiplier 32 bit  - unsigned 

input [31:0] a;
input [31:0] b;
output [61:0] p;

wire [31:0] l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l30,l31,l32;
wire [61:0] s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32;

assign l1 = {32{b[0]}}&a[31:0];
assign l2 = {32{b[1]}}&a[31:0];
assign l3 = {32{b[2]}}&a[31:0];
assign l4 = {32{b[3]}}&a[31:0];
assign l5 = {32{b[4]}}&a[31:0];
assign l6 = {32{b[5]}}&a[31:0];
assign l7 = {32{b[6]}}&a[31:0];
assign l8 = {32{b[7]}}&a[31:0];
assign l9 = {32{b[8]}}&a[31:0];

assign l10 = {32{b[9]}}&a[31:0];
assign l11 = {32{b[10]}}&a[31:0];
assign l12 = {32{b[11]}}&a[31:0];
assign l13 = {32{b[12]}}&a[31:0];
assign l14 = {32{b[13]}}&a[31:0];
assign l15 = {32{b[14]}}&a[31:0];
assign l16 = {32{b[15]}}&a[31:0];
assign l17 = {32{b[16]}}&a[31:0];
assign l18 = {32{b[17]}}&a[31:0];
assign l19 = {32{b[18]}}&a[31:0];

assign l20 = {32{b[19]}}&a[31:0];
assign l21 = {32{b[20]}}&a[31:0];
assign l22 = {32{b[21]}}&a[31:0];
assign l23 = {32{b[22]}}&a[31:0];
assign l24 = {32{b[23]}}&a[31:0];
assign l25 = {32{b[24]}}&a[31:0];
assign l26 = {32{b[25]}}&a[31:0];
assign l27 = {32{b[26]}}&a[31:0];
assign l28 = {32{b[27]}}&a[31:0];
assign l29 = {32{b[28]}}&a[31:0];
assign l30 = {32{b[29]}}&a[31:0];
assign l31 = {32{b[30]}}&a[31:0];
assign l32 = {32{b[31]}}&a[31:0];



assign s1 = l1 + (l2<<1);
assign s2 = s1 + (l3<<2);
assign s3 = s2 + (l4<<3);
assign s4 = s3 + (l5<<4);
assign s5 = s4 + (l6<<5);
assign s6 = s5 + (l7<<6);
assign s7 = s6 + (l8<<7);
assign s8 = s7 + (l9<<8);
assign s9 = s8 + (l10<<9);

assign s10 = s9  + (l11<<10);
assign s11 = s10 + (l12<<11);
assign s12 = s11 + (l13<<12);
assign s13 = s12 + (l14<<13);
assign s14 = s13 + (l15<<14);
assign s15 = s14 + (l16<<15);
assign s16 = s15 + (l17<<16);
assign s17 = s16 + (l18<<17);
assign s18 = s17 + (l19<<18);
assign s19 = s18 + (l20<<19);

assign s20 = s19 + (l21<<20);
assign s21 = s20 + (l22<<21);
assign s22 = s21 + (l23<<22);
assign s23 = s22 + (l24<<23);
assign s24 = s23 + (l25<<24);
assign s25 = s24 + (l26<<25);
assign s26 = s25 + (l27<<26);
assign s27 = s26 + (l28<<27);
assign s28 = s27 + (l29<<28);
assign s29 = s28 + (l30<<29);
assign s30 = s29 + (l31<<30);
assign s31 = s30 + (l32<<31);
assign p= s31;

endmodule