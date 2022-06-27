`timescale 1ns / 1ps
module test ();
	reg A_0_0, A_1_0, A_0_1, A_1_1, v_0, v_1;
	wire u_0, u_1;
	matrix_vec_mul uut(
	.A_0_0(A_0_0),
	.A_1_0(A_1_0),
	.A_0_1(A_0_1),
	.A_1_1(A_1_1),
	.v_0(v_0),
	.v_1(v_1),
	.u_0(u_0),
	.u_1(u_1)
	);
	initial begin
		A_0_0 = 0;
		A_1_0 = 0;
		A_0_1 = 0;
		A_1_1 = 0;
		v_0 = 0;
		v_1 = 0;

		$dumpfile("02_2x2_vec_mul_tb.vcd");
		$dumpvars(0, test);
		#320 $finish;
	end
	always
		 #5 A_0_0 = ~A_0_0;
	always
		 #10 A_1_0 = ~A_1_0;
	always
		 #20 A_0_1 = ~A_0_1;
	always
		 #40 A_1_1 = ~A_1_1;
	always
		 #80 v_0 = ~v_0;
	always
		 #160 v_1 = ~v_1;
	initial begin
		$monitor("%d %d %d %d %d %d %d %d" ,A_0_0, A_1_0, A_0_1, A_1_1, v_0, v_1, u_0, u_1, );
	end
endmodule