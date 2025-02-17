import numpy as np

# Read Trained Weights
with open('weights.txt', 'r') as f:
    lines = f.readlines()

verilog_params = ""
scale_factor = 128  # Convert float to 8-bit fixed-point

current_layer = ""
index = 0

for line in lines:
    if "Layer" in line:
        current_layer = line.strip().split(": ")[1]
        index = 0
        verilog_params += f"// {current_layer} Layer Weights\n"
    else:
        values = line.strip().split()
        for val in values:
            weight = int(float(val) * scale_factor)
            verilog_params += f"parameter signed [7:0] W_{current_layer}_{index} = 8'd{weight};\n"
            index += 1
        verilog_params += "\n"

# Save to File
with open('weights_verilog.txt', 'w') as f:
    f.write(verilog_params)

print("Weights converted to weights_verilog.txt")

