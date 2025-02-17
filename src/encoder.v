module encoder (
    input wire clk,
    input wire signed [7:0] input_signal,
    input wire signed [7:0] w1_0, w1_1, w1_2, w1_3, // Weights for Layer 1
    input wire signed [7:0] b1_0, b1_1, b1_2, b1_3, // Biases for Layer 1
    input wire signed [7:0] w2_0, w2_1,             // Weights for Layer 2
    input wire signed [7:0] b2_0, b2_1,             // Biases for Layer 2
    output wire signed [7:0] feature0,              // Compressed output (2 neurons)
    output wire signed [7:0] feature1
);
// Encoder Layer (Trained Weights)
parameter signed [7:0] W1_0 = 8'd12;
parameter signed [7:0] W1_1 = 8'd65;
parameter signed [7:0] W1_2 = 8'd23;
parameter signed [7:0] W1_3 = 8'd87;


    wire signed [7:0] layer1_out0, layer1_out1, layer1_out2, layer1_out3;

    // Hidden Layer 1 (4 Neurons)
    hidden_layer layer1 (
        .clk(clk),
        .input_signal(input_signal),
        .weight0(w1_0), .weight1(w1_1), .weight2(w1_2), .weight3(w1_3),
        .bias0(b1_0), .bias1(b1_1), .bias2(b1_2), .bias3(b1_3),
        .output0(layer1_out0), .output1(layer1_out1), 
        .output2(layer1_out2), .output3(layer1_out3)
    );

    // Hidden Layer 2 (2 Neurons) – Encoder output (compressed features)
    perceptron p0 (.clk(clk), .input_signal(layer1_out0), .weight(w2_0), .bias(b2_0), .output_signal(feature0));
    perceptron p1 (.clk(clk), .input_signal(layer1_out1), .weight(w2_1), .bias(b2_1), .output_signal(feature1));

endmodule
