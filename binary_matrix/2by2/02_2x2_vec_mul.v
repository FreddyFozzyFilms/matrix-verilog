// Time scale and resolution for simulation
`timescale 1ns / 1ps

/* In this module we define matrix vector multiplication for 2 x 2 matrices over
the scaler field of the dihedral group D_2 of order 2 (multiplication and addition mod 2)

in D_2, 
    multiplication corresponds to and
    addition corresponds to xor

 */
module matrix_vec_mul (

    // 2x2 matrix M
    input wire a,
    input wire b,
    input wire c,
    input wire d,

    input wire e,
    input wire f,

    // u
    output wire g,
    output wire h

    // u = M v
    );

    //|g| |a  b| |e|
    //| |=|    | | |
    //|h| |c  d| |f|
    assign g = (a && e) ^ (b && f);
    assign h = (c && e) ^ (d && f); 
endmodule