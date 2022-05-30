// n x n matrice * n vector
module dot_product (
    parameter n = 3;
    integer i;

    // module structure
    input wire [1:0] v1 [0:n-1]; // binary vector 
    input wire [1:0] v2 [0:n-1]; // binary vector

    output wire d; // output binary unsigned-integer (value of the dot product)

    // internal wiring

    // intermediate vectors
    wire [1:0] u1 [0:n-1];
    wire [1:0] u2 [0:n-1];

    // assign entry wise product to u1
    for (i = 0; i < n; i = i + 1) begin
        assign u1[i] = v1[i] & v2[i];
    end
    // assign sum over entry wise product (aka summation over u1) to d
    assign u2[0] = u1[0];
    for (i = 1; i < n; i = i + 1) begin
        assign u2[i] = u2[i-1] ^ u1[i]; // use xor
    end

    assign d = u2[n-1];

endmodule