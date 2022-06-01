f = open("vec_mul.v", "w")

n = 2

f.write("module matrix_vec_mul ( \n")

# declarations
# declare matrix
for i in range(n):
    for j in range(n):
        f.write(f"input wire A_{i}_{j},\n")
# declare vector in
for i in range(n):
    f.write(f"input wire v_{i},\n")
# declare vector out
for i in range(n - 1):
    f.write(f"output wire u_{i}, \n")
f.write(f"output wire u_{n-1}\n);\n")

for j in range(n):
    for i in range(n):
        f.write(f"assign u_{j} = A_")



f.write("pigu\n")
f.close()