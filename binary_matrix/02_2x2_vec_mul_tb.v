// Simulation time scale and precision
`timescale 1ns / 1ps

module test();

    // Internal signals
    /* Signals to make connections to the UUT */
    reg a, b, c, d, e, f;    // inputs to the UUT
    wire g, h;         // output of the UUT

    matrix_vec_mul uut (.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h));

    initial begin
        // Input signal initialization
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        
        e = 0;
        f = 0;

        // Waveform generation
        $dumpfile("02_2x2_vec_mul_tb.vcd");  // Waveform file
        $dumpvars(0, test);         // signals to plot (everything)

        // We finish simulation at t=100
        #320 $finish;
    end

    /* Generation of input patterns to simulate the UUT */
    // a, b and c will got through all possible combinations
    always
        #5 a = ~a;
    always
        #10 b = ~b;
    always
        #20 c = ~c;
    always
        #40 d = ~d;

    always
        #80 e = ~e;
    always
        #160 f = ~f;
    
    initial begin
        $monitor("%d %d %d %d %d %d %d %d", a, b, c, d, e, f, g, h, );
    end
endmodule // test
