// Time scale and resolution for simulation
`timescale 1ns / 1ps

/* In this module we define matrix vector multiplication for 2 x 2 matrices over
the scaler field of the dihedral group D_2 of order 2 (multiplication and addition mod 2)

D_2 actually forms a boolean algebra and hence we can use & for * and | for +.
 */
module matrix_vec_mul (
    // u
    output wire g,
    output wire h,

    // 2x2 matrix M
    input wire a,
    input wire b,
    input wire c,
    input wire d,

    input wire e,
    input wire f

    // u = M v
    );

    //|g| |a  b| |e|
    //| |=|    | | |
    //|h| |c  d| |f|
    assign g = a & e | b & f;
    assign h = c & e | d & f; 
endmodule // voter