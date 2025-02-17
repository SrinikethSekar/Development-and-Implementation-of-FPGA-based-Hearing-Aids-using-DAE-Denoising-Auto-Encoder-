module decoder (
    input wire clk,
    input wire signed [7:0] feature0,         // Compressed features from encoder
    input wire signed [7:0] feature1,
    input wire signed [7:0] w3_0, w3_1,       // Weights for Layer 1
    input wire signed [7:0] b3_0, b3_1,       // Biases for Layer 1
    input wire signed [7:0] w4_0, w4_1, w4_2, w4_3, // Weights for Output Layer
    input wire signed [7:0] b4_0, b4_1, b4_2, b4_3, // Biases for Output Layer
    output wire signed [7:0] output0,         // Denoised output (4 neurons)
    output wire signed [7:0] output1,
    output wire signed [7:0] output2,
    output wire signed [7:0] output3
);
// Decoder Layer (Trained Weights)
parameter signed [7:0] W2_0 = 8'd11;
parameter signed [7:0] W2_1 = 8'd22;


    wire signed [7:0] layer1_out0, layer1_out1;

    // Hidden Layer (2 Neurons from 2 Features)
    perceptron p0 (.clk(clk), .input_signal(feature0), .weight(w3_0), .bias(b3_0), .output_signal(layer1_out0));
    perceptron p1 (.clk(clk), .input_signal(feature1), .weight(w3_1), .bias(b3_1), .output_signal(layer1_out1));

    // Output Layer (4 Neurons)
    perceptron p2 (.clk(clk), .input_signal(layer1_out0), .weight(w4_0), .bias(b4_0), .output_signal(output0));
    perceptron p3 (.clk(clk), .input_signal(layer1_out0), .weight(w4_1), .bias(b4_1), .output_signal(output1));
    perceptron p4 (.clk(clk), .input_signal(layer1_out1), .weight(w4_2), .bias(b4_2), .output_signal(output2));
    perceptron p5 (.clk(clk), .input_signal(layer1_out1), .weight(w4_3), .bias(b4_3), .output_signal(output3));

endmodule
