// Simulation time scale and precision
`timescale 1ns / 1ps

module test();

    // Internal signals
    /* Signals to make connections to the UUT */
    reg A_0_0, A_0_1, A_1_0, A_1_1, v_0, v_1;    // inputs to the UUT
    wire u_0, u_1;         // output of the UUT

    matrix_vec_mul uut (
    .A_0_0(A_0_0), .A_0_1(A_0_1), 
    .A_1_0(A_1_0), .A_1_1(A_1_1), 

    .v_0(v_0), .v_1(v_1),
    .u_0(u_0), .u_1(u_1)
    );

    initial begin
        // Input signal initialization
        A_0_0 = 0; 
        A_0_1 = 0;
        A_1_0 = 0;
        A_1_1 = 0;
        
        v_0 = 0;
        v_1 = 0;

        // Waveform generation
        $dumpfile("02_2x2_vec_mul_tb.vcd");  // Waveform file
        $dumpvars(0, test);         // signals to plot (everything)

        // We finish simulation at t=100
        #320 $finish;
    end

    /* Generation of input patterns to simulate the UUT */
    // a, b and c will got through all possible combinations
    always
        #5 A_0_0 = ~A_0_0;
    always
        #10 A_0_1 = ~A_0_1;
    always
        #20 A_1_0 = ~A_1_0;
    always
        #40 A_1_1 = ~A_1_1;

    always
        #80 v_0 = ~v_0;
    always
        #160 v_1 = ~v_1;
    
    initial begin
        $monitor("%d %d %d %d %d %d %d %d", A_0_0, A_0_1, A_1_0, A_1_1, v_0, v_1, u_0, u_1,);
    end
endmodule // test
