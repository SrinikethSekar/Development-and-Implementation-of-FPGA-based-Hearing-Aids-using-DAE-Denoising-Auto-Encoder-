module hidden_layer (
    input wire clk,
    input wire signed [7:0] input_signal, // 8-bit input
    input wire signed [7:0] weight0,      // Separate weights
    input wire signed [7:0] weight1,
    input wire signed [7:0] weight2,
    input wire signed [7:0] weight3,
    input wire signed [7:0] bias0,        // Separate biases
    input wire signed [7:0] bias1,
    input wire signed [7:0] bias2,
    input wire signed [7:0] bias3,
    output wire signed [7:0] output0,     // Separate outputs
    output wire signed [7:0] output1,
    output wire signed [7:0] output2,
    output wire signed [7:0] output3
);

    // Instantiate 4 Perceptrons separately
    perceptron p0 (.clk(clk), .input_signal(input_signal), .weight(weight0), .bias(bias0), .output_signal(output0));
    perceptron p1 (.clk(clk), .input_signal(input_signal), .weight(weight1), .bias(bias1), .output_signal(output1));
    perceptron p2 (.clk(clk), .input_signal(input_signal), .weight(weight2), .bias(bias2), .output_signal(output2));
    perceptron p3 (.clk(clk), .input_signal(input_signal), .weight(weight3), .bias(bias3), .output_signal(output3));

endmodule
