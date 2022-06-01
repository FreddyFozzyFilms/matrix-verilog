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
    input wire A_0_0, input wire A_1_0,
    input wire A_0_1, input wire A_1_1,

    input wire v_0,
    input wire v_1,

    // u
    output wire u_0,
    output wire u_1

    // u = M v
    );

    //|g| |a  b| |e|
    //| |=|    | | |
    //|h| |c  d| |f|
    assign u_0 = (A_0_0 && v_0) ^ (A_1_0 && v_1);
    assign u_1 = (A_0_1 && v_0) ^ (A_1_1 && v_1); 
endmodule