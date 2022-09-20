//D-latch
module D_latch(D,Clk,Qa,Qb);
input D,Clk;
output Qa,Qb;
wire S,R,S_g,R_g;
	assign	R = ~D,
		S = D,
		S_g = ~(S & Clk),
		R_g = ~(R & Clk),
		Qa = ~(S_g & Qb),
		Qb = ~(R_g & Qa);
endmodule

//D-ff
module D_ff(D,Clk,Qa,Qb);
input D,Clk;
output Qa,Qb;
wire Cm,Qm;
	assign	Cm = ~Clk;
D_latch D1(D,Cm,Qm);
D_latch D0(Qm,Clk,Qa,Qb);
endmodule

//JK-ff 
module JK_ff(J,K,Clk,Q,Qn);
input J,K,Clk;
output Q,Qn;
wire D;
	assign D = (Qn & J) | (~K & Q);
D_ff(D,Clk,Q,Qn);
endmodule
