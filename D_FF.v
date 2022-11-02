module D_FF(
	input wire clk, reset, en, //en: enable 
	input wire d,
	output reg q
	
);

always @(posedge clk, posedge reset)
begin
	if (reset ==1)
		q<=0;
	else if (en==1)
		q<=d;
end
endmodule