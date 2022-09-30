module Negative16bit#(parameter n=8)(input[15:0] A, output reg[15+$clog2(n):0] O);
	reg[15:0] B;
	always@(A) begin
		if(A[15] == 1'b1) begin
			B = {1'b0, A[14:0]};
			O = -B;
		end
		else
			O = A;
	end
endmodule
