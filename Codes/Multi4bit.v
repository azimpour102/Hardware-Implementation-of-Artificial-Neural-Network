module Multi4bit(input[3:0] A, B, output[7:0] C);
	wire[3:0] O[3:0];
	wire[7:0] AO[1:0];
	Multi2bit m1(A[1:0], B[1:0], O[0]);
	Multi2bit m2(A[3:2], B[1:0], O[1]);
	Multi2bit m3(A[1:0], B[3:2], O[2]);
	Multi2bit m4(A[3:2], B[3:2], O[3]);
	Adder8bit a1({4'b0000, O[0]}, {2'b00, O[1], 2'b00}, AO[0]);
	Adder8bit a2({2'b00, O[2], 2'b00}, {O[3], 4'b0000}, AO[1]);
	Adder8bit a3(AO[0], AO[1], C);
endmodule
