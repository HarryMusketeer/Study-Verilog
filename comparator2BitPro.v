//comparator 2 bit using procedure assignment statements
module comparator2BitPro(
	input wire [1:0] a,b,
	output reg eq
);

always @(a,b)
begin
	if (a[0]==b[0] && a[1]== b[1])
		eq=1;
	else
		eq=0;
end
endmodule