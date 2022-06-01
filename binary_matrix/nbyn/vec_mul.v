module matrix_vec_mul ( 
input wire A_0_0,
input wire A_0_1,
input wire A_1_0,
input wire A_1_1,

input wire v_0,
input wire v_1,

output wire u_0, 
output wire u_1
);

assign u_0 = (A_0_0 && v_0) ^ (A_1_0 && v_1);
assign u_1 = (A_0_1 && v_0) ^ (A_1_1 && v_1);
endmodule