`timescale 1ns / 1ps
module test ();
	reg A_0_0, A_1_0, A_2_0, A_0_1, A_1_1, A_2_1, A_0_2, A_1_2, A_2_2, v_0, v_1, v_2;
	wire u_0, u_1, u_2;
	matrix_vec_mul uut(
	.A_0_0(A_0_0),
	.A_1_0(A_1_0),
	.A_2_0(A_2_0),
	.A_0_1(A_0_1),
	.A_1_1(A_1_1),
	.A_2_1(A_2_1),
	.A_0_2(A_0_2),
	.A_1_2(A_1_2),
	.A_2_2(A_2_2),
	.v_0(v_0),
	.v_1(v_1),
	.v_2(v_2),
	.u_0(u_0),
	.u_1(u_1),
	.u_2(u_2)
	);
	initial begin
		A_0_0 = 0;
		A_1_0 = 0;
		A_2_0 = 0;
		A_0_1 = 0;
		A_1_1 = 0;
		A_2_1 = 0;
		A_0_2 = 0;
		A_1_2 = 0;
		A_2_2 = 0;
		v_0 = 0;
		v_1 = 0;
		v_2 = 0;

		$dumpfile("02_2x2_vec_mul_tb.vcd");
		$dumpvars(0, test);
		#20480 $finish;
	end
	always
		 #5 A_0_0 = ~A_0_0;
	always
		 #10 A_1_0 = ~A_1_0;
	always
		 #20 A_2_0 = ~A_2_0;
	always
		 #40 A_0_1 = ~A_0_1;
	always
		 #80 A_1_1 = ~A_1_1;
	always
		 #160 A_2_1 = ~A_2_1;
	always
		 #320 A_0_2 = ~A_0_2;
	always
		 #640 A_1_2 = ~A_1_2;
	always
		 #1280 A_2_2 = ~A_2_2;
	always
		 #2560 v_0 = ~v_0;
	always
		 #5120 v_1 = ~v_1;
	always
		 #10240 v_2 = ~v_2;
	initial begin
		$monitor("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d" ,A_0_0, A_1_0, A_2_0, A_0_1, A_1_1, A_2_1, A_0_2, A_1_2, A_2_2, v_0, v_1, v_2, u_0, u_1, u_2, );
	end
endmodule