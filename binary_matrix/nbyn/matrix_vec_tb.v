// Simulation time scale and precision
`timescale 1ns / 1ps

module test();
    parameter n = 3;
    integer i, j, index;
    // Internal signals
    /* Signals to make connections to the UUT */

    reg [1:0] M [0:n-1] [0:n-1]; // binary matrix
    reg [1:0] v [0:n-1]; // binary vector 

    wire [1:0] u [0:n-1]; // binary vector

    matrix_vec_mul uut (.M(M), .v(v), .u(u));

    initial begin
        // Input signal initialization
        for (i = 0; i < n; i = i + 1) begin
            v[i] = 0;
        end

        for (i = 0; i < n; i = i + 1) begin
            for (j = 0; j < n; j = j + 1) begin
                M[i][j] = 0;
            end
        end

        // Waveform generation
        $dumpfile("02_nxn_vec_mul_tb.vcd");  // Waveform file
        $dumpvars(0, test);         // signals to plot (everything)

        // We finish simulation at t=100
        #(2**(n * n + n)) $finish;
    end

    /* Generation of input patterns to simulate the UUT */
    // go through all possible values of M and v

    // vector v combinations
    genvar x, y;
    generate
    for (x = 0; x < n; x = x + 1) begin
        always
            #(5 * 2**i) v[i] = ~v[i];
    end

    // all matrix M combinations
    for (x = 0; x < n; x = x + 1) begin
        for (y = 0; y < n; y = y + 1) begin
            always
                #(5 * 2**(n-1 + i + j)) M[i][j] = ~M[i][j];
        end
    end
    endgenerate
    
    // initial begin
    //     $monitor("%d %d %d %d %d %d %d %d", a, b, c, d, e, f, g, h, );
    // end
endmodule // test
