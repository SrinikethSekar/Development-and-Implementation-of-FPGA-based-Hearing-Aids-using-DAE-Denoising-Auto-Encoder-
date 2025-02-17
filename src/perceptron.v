module perceptron (
    input wire clk,
    input wire signed [7:0] input_signal,  // 8-bit input
    input wire signed [7:0] weight,       // 8-bit weight
    input wire signed [7:0] bias,         // 8-bit bias
    output reg signed [7:0] output_signal // 8-bit output
);

    reg signed [15:0] sum; // 16-bit sum for multiplication result

    // Weighted sum calculation: y = w*x + b
    always @(posedge clk) begin
        sum = (input_signal * weight) + bias;
        // ReLU Activation: output = max(0, sum)
        output_signal = (sum[15] == 1) ? 8'd0 : sum[7:0]; 
    end

endmodule
