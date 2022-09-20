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

//JK-ff 
module JK_ff(J,K,Clk,Q,Qn);
input J,K,Clk;
output Q,Qn;
wire D;
	assign D = (Qn & J) | (~K & Q);
D_latch(D,Clk,Q,Qn);
endmodule
