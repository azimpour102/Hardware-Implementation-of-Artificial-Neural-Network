module FA(input a, b, cin, output s, cout);
	wire l, r;
	wire x, nx;
	wire notCin;

	not n1(notCin, cin);
	xor g1(x, a, b);
	not n2(nx, x);
	and a1(l, notCin, x);
	and a2(r, cin, nx);
	or o1(s, l, r);

	wire p, q;
	and b1(andd, a, b);
	or o2(orr, a, b);
	and b2(q, notCin, andd);
	and b3(p, orr, cin);
	or o3(cout, p, q);
endmodule
