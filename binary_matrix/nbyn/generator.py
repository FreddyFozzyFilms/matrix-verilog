import sys
n = int(sys.argv[1])

fs = open("vec_mul.v", "w")

fs.write("`timescale 1ns / 1ps\n")
fs.write("module matrix_vec_mul ( \n")

# declarations
# declare matrix
for i in range(n):
    for j in range(n):
        fs.write(f"input wire A_{j}_{i},\n")
fs.write("\n")
# declare vector in
for i in range(n):
    fs.write(f"input wire v_{i},\n")
fs.write("\n")
# declare vector out
for i in range(n - 1):
    fs.write(f"output wire u_{i}, \n")
fs.write(f"output wire u_{n-1}\n);\n\n")

for j in range(n):
    fs.write(f"assign u_{j} = (A_{0}_{j} && v_{0})")
    for i in range(1, n):
        fs.write(f" ^ (A_{i}_{j} && v_{i})")
    fs.write(";\n")
fs.write("endmodule")
fs.close()