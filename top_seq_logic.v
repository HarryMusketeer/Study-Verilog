module top_seq_logic(
	input wire sel,
	input wire [1:0] in,
	input wire clk,
	input wire rst,
	output wire out);
	
	
	wire [1:0] z;
	
	//module instance 1
	sequence_logic seq_logic1(
	.w (in[1]),
	.clock (clk),
	.reset (rst),
	.z (z[1])
	);
	
	//module instance 2
	sequence_logic seq_logic2(
	.w (in[0]),
	.clock (clk),
	.reset (rst),
	.z (z[0])
	);
	
	//define mux
	assign out = sel ? z[1] : z[0]; 
	
endmodule