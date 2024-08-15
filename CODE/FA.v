module FA(a,b,cin,s,cout);
	output s,cout;
	input cin,a,b;
	
	wire x,y,z;
	
	xor(x,a,b); 
	xor(s,x,cin);

	and(y,a,b);
	and(z,cin,x);
	or (cout,y,z);
	
endmodule
