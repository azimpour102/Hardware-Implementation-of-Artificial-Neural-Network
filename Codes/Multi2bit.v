module Multi2bit(input[1:0] a, b, output [3:0] w);
	wire[1:0] notA;
	wire[1:0] notB;

	not n0(notA[0], a[0]);
	not n1(notA[1], a[1]);
	
	not n2(notB[0], b[0]);
	not n3(notB[1], b[1]);

	and a0(w[0], a[0], b[0]);

	wire x, y;
	or o0(x, notA[1], notB[0]);
	or o1(y, notA[0], notB[1]);
	wire l, r;
	and a1(l, a[0], b[1], x);
	and a2(r, a[1], b[0], y);
	or o2(w[1], l, r);

	wire z;
	or o3(z, notA[0], notB[0]);
	and a3(w[2], a[1], b[1], z);

	and a4(w[3], a[1], a[0], b[1], b[0]);
	
endmodule
