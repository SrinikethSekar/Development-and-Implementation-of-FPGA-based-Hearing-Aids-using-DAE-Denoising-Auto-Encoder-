# FPGA-Based Noise Cancellation System Using HDL-Based Denoising Autoencoder

## 📝 Introduction
This project implements a noise cancellation system using a Denoising Autoencoder (DAE) on FPGA. The model, trained in Python (TensorFlow), is deployed using Verilog on FPGA for real-time noise suppression.

## 📌 Features
- Noise cancellation using DAE architecture
- Sine wave input from ROM
- Random noise generation module
- Clean signal output verified with GTKWave
- Compatible with Icarus Verilog and Xilinx Vivado

## 🛠️ Project Structure
📂 noise_cancellation_fpga

┣ 📂 src

┃ ┣ 📜 perceptron.v

┃ ┣ 📜 hidden_layer.v

┃ ┣ 📜 encoder.v

┃ ┣ 📜 decoder.v

┃ ┗ 📜 top_noise_cancellation.v

┣ 📂 tb

┃ ┗ 📜 tb_top.v

┣ 📂 weights

┃ ┗ 📜 exported_weights.mem

┗ 📜 README.md



## 🖥️ Tools Required
- Icarus Verilog (`iverilog`, `vvp`)
- GTKWave
- Xilinx Vivado (for synthesis and bitstream generation)
- Python (for model training and weight export)

## 📌 FPGA Synthesis with Vivado
Open Xilinx Vivado and create a new project.
Add all src/*.v files and set top_noise_cancellation.v as the top module.
Import exported_weights.mem into ROM initialization.
Run Synthesis, Implementation, and Bitstream Generation.

## 👨‍💻 Authors & Contributions
Sriniketh Sekar - Verilog Modules, Simulation, and FPGA Synthesis

Nithish Roy , Sriniketh Sekar - DAE Model Training and Weight Export

## 📄 License
This project is licensed under the MIT License.


