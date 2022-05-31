// Time scale and resolution for simulation
`timescale 1ns / 1ps

/* In this module we define matrix vector multiplication for 2 x 2 matrices over
the scaler field of the dihedral group D_2 of order 2 (multiplication and addition mod 2)

in D_2, 
    multiplication corresponds to and
    addition corresponds to xor

*/

// note:
//   M is a column matrix
//   v is a column

// this means that is an array of column vectors
// if we want to access the rows directlly, we must transpose M

// n x n matrice * n vector
// n x n matrice * n vector

module dot_product ( v1, v2, d);
    parameter n = 3;

    // module structure
    input wire [1:0] v1 [0:n-1]; // binary vector 
    input wire [1:0] v2 [0:n-1]; // binary vector

    output wire d; // output binary unsigned-integer (value of the dot product)

    // internal wiring

    // intermediate vectors
    wire [1:0] u1 [0:n-1];
    wire [1:0] u2 [0:n-1];

    // assign entry wise product to u1
    genvar i;
    generate
    for (i = 0; i < n; i = i + 1) begin
        assign u1[i] = v1[i] & v2[i];
    end
    // assign sum over entry wise product (aka summation over u1) to d
    assign u2[0] = u1[0];
    for (i = 1; i < n; i = i + 1) begin
        assign u2[i] = u2[i-1] ^ u1[i]; // use xor
    end
    endgenerate

    assign d = u2[n-1];

endmodule

module matrix_vec_mul (M, v, u);
    parameter n = 3;

    // module structure
    input wire [1:0] M [0:n-1] [0:n-1]; // binary matrix
    input wire [1:0] v [0:n-1]; // binary vector 

    output wire [1:0] u [0:n-1]; // binary vector

    // internal wiring
    wire [1:0] MT [0:n-1] [0:n-1]; // transposed matrix

    // transpose matrix
    genvar x, y;
    generate
    for (x = 0; x < n; x = x + 1) begin
      for (y = 0; y < n; y = y + 1) begin
          assign MT[x][y] = M[y][x]; // swap rows for column
      end
    end

    // take dot product of each row of M (each column of MT) with v
    for (x = 0; x < n; x = x + 1) begin
        dot_product U0(.v1(MT[x]), .v2(v), .d(u[x]));
    end
    endgenerate
endmodule