# 1️⃣ Create Project
create_project noise_cancellation ./vivado_project -part xc7a35ticsg324-1L

# 2️⃣ Add Design Files
add_files [glob ./src/*.v]

# 3️⃣ Add Constraints
add_files -fileset constrs_1 ./constraints/top_constraints.xdc

# 4️⃣ Set Top Module
set_property top top_noise_cancellation [current_fileset]

# 5️⃣ Run Synthesis
launch_runs synth_1
wait_on_run synth_1

# 6️⃣ Run Implementation
launch_runs impl_1
wait_on_run impl_1

# 7️⃣ Generate Bitstream
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1

# 8️⃣ Open Hardware Manager and Program FPGA
open_hw_manager
connect_hw_server
open_hw_target
set_property PROGRAM.FILE [get_files ./vivado_project/noise_cancellation.runs/impl_1/top_noise_cancellation.bit] [get_hw_devices xc7a35t_0]
program_hw_devices [get_hw_devices xc7a35t_0]

puts "🎉 FPGA Programmed with DAE Model"
