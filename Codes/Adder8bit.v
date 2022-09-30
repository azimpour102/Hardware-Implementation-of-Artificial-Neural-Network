module Adder8bit(input[7:0] A, B, output[7:0] W);
	wire[7:0] c;
	FA f1(A[0], B[0], 1'b0, W[0], c[0]);
	FA f2(A[1], B[1], c[0], W[1], c[1]);
	FA f3(A[2], B[2], c[1], W[2], c[2]);
	FA f4(A[3], B[3], c[2], W[3], c[3]);
	FA f5(A[4], B[4], c[3], W[4], c[4]);
	FA f6(A[5], B[5], c[4], W[5], c[5]);
	FA f7(A[6], B[6], c[5], W[6], c[6]);
	FA f8(A[7], B[7], c[6], W[7], c[7]);
endmodule
