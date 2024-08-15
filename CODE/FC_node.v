module FC_node #(parameter DATA_WIDTH =32,N=32)(CLK,RST_N,E,IN,OUT,valid_out,RAM,bias,Q,Q1);
input CLK,RST_N,E;
input [DATA_WIDTH-1:0] IN,RAM,bias;
output [DATA_WIDTH-1:0] OUT;
output valid_out;

integer counter=0;
always @(posedge CLK or negedge RST_N) begin
		if(RST_N==1'b0) counter = 0 ;
		else if (counter < N) counter = counter +1;
		else counter=0;
end

output [31:0] Q,Q1;
reg [31:0] b;
mult_24bit mult(.a(IN),.b(RAM),.p(Q));
always @(*) begin
if (RST_N==1'b0) b = 32'b0;
else b = Q1;
end
adder #( DATA_WIDTH) a1(.s(Q1),.co(),.cin(0),.a(Q),.b(b));
adder #( DATA_WIDTH) a2(.s(OUT),.co(),.cin(0),.a(Q1),.b(bias));

delay_valid #(N) inst(.clk(CLK),.resetn(RST_N),.valid_in(E),.valid_out(valid_out));

endmodule