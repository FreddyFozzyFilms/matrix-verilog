import sys
n = int(sys.argv[1])

fs = open("vec_mul_tb.v", "w")

fs.write("`timescale 1ns / 1ps\n")
fs.write("module test ();\n")

inputVars = []

fs.write("\treg ")
for i in range(n):
    for j in range(n):
        fs.write(f"A_{j}_{i}, ")
        inputVars.append(f"A_{j}_{i}")

for i in range(n-1):
    fs.write(f"v_{i}, ")
    inputVars.append(f"v_{i}")
fs.write(f"v_{n-1};\n")
inputVars.append(f"v_{n-1}")

vars = inputVars.copy()
fs.write("\twire")
for i in range(n-1):
    fs.write(f" u_{i},")
    vars.append(f"u_{i}")
fs.write(f" u_{n-1};\n")
vars.append(f"u_{n-1}")

print(vars)

fs.write("\tmatrix_vec_mul uut(\n")
for i in range(len(vars) - 1):
    fs.write(f"\t.{vars[i]}({vars[i]}),\n")
fs.write(f"\t.{vars[-1]}({vars[-1]})\n\t);\n")

fs.write("\tinitial begin\n")
for var in inputVars:
    fs.write(f"\t\t{var} = 0;\n")
fs.write("\n")

fs.write('\t\t$dumpfile("02_2x2_vec_mul_tb.vcd");\n')
fs.write('\t\t$dumpvars(0, test);\n')

fs.write(f'\t\t#{5*2**(n*n + n)} $finish;\n')
fs.write("\tend\n")

for i in range(len(inputVars)):
    fs.write("\talways\n")
    fs.write(f"\t\t #{5*2**i} {inputVars[i]} = ~{inputVars[i]};\n")

fs.write("\tinitial begin\n")
fs.write("\t\t$monitor(\""+' '.join([("%"+"d")]*len(vars))+"\" ,")
for var in vars:
    fs.write(f"{var}, ")
fs.write(");\n\tend\n")

fs.write("endmodule")
fs.close()