module Multi8bit(input[7:0] A, B, output[15:0] C);
	wire[7:0] O[3:0];
	wire[15:0] AO[1:0];
	wire[7:0] _A,_B;
	wire[15:0] _C;
	assign _A={1'b0,A[6:0]};
	assign _B={1'b0,B[6:0]};
	assign C[14:0]=_C[14:0];
	Multi4bit m1(_A[3:0], _B[3:0], O[0]);
	Multi4bit m2(_A[7:4], _B[3:0], O[1]);
	Multi4bit m3(_A[3:0], _B[7:4], O[2]);
	Multi4bit m4(_A[7:4], _B[7:4], O[3]);
	Adder16bit a1({8'd0, O[0]}, {4'd0, O[1], 4'd0}, AO[0]);
	Adder16bit a2({4'd0, O[2], 4'd0}, {O[3], 8'd0}, AO[1]);
	Adder16bit a3(AO[0], AO[1], _C);
	xor(C[15],A[7],B[7]);
endmodule
