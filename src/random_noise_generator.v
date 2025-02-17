module random_noise_generator (
    input wire clk,        // Clock signal
    input wire rst,        // Reset signal
    output reg [7:0] noise_out // 8-bit random noise output
);

    reg [15:0] lfsr;       // 16-bit LFSR register for random number generation

    // LFSR Implementation with XOR Feedback
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            lfsr <= 16'hACE1; // Initial seed value
        end else begin
            // Polynomial for feedback: x^16 + x^13 + x^12 + x^10 + 1
            lfsr <= {lfsr[14:0], lfsr[15] ^ lfsr[13] ^ lfsr[12] ^ lfsr[10]};
        end
    end

    // Output is assigned inside always block
    always @(posedge clk) begin
        noise_out <= lfsr[7:0]; // Use lower 8 bits as noise output
    end

endmodule
