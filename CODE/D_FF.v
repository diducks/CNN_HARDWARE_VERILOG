module D_FF #(parameter WIDTH = 16 )(CLK,RST,IN,Q,E);
input CLK,RST,E;
input [WIDTH-1:0] IN;
output reg [WIDTH-1:0] Q;

always @(posedge CLK or negedge RST) begin
	if	(!RST)	
		Q<=0;
	else if(E==1'b1)
		Q <= IN;
	else Q<=Q;
end

endmodule
