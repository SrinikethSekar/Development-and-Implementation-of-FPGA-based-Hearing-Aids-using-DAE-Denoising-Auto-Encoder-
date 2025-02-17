module top_noise_cancellation (
    input wire clk,              // System Clock
    input wire rst,              // Reset
    output wire signed [7:0] noisy_signal,   // Noisy Sine Wave
    output wire signed [7:0] clean_signal0,  // Denoised Output
    output wire signed [7:0] clean_signal1,
    output wire signed [7:0] clean_signal2,
    output wire signed [7:0] clean_signal3
);

    // Address for ROM (1024 samples)
    reg [9:0] addr = 10'd0;

    // ROM Output (Sine Wave)
    wire signed [7:0] sine_wave;

    // Noise Output
    wire signed [7:0] noise;

    // Instantiate Sine Wave ROM
    sine_wave_rom rom_inst (
        .clk(clk),
        .addr(addr),
        .data(sine_wave)
    );

    // Instantiate Noise Generator
    random_noise_generator noise_inst (
        .clk(clk),
        .rst(rst),
        .noise_out(noise)
    );

    // Combine Sine Wave and Noise
    assign noisy_signal = sine_wave + noise;

    // Auto-increment Address (Every Clock Cycle)
    always @(posedge clk) begin
        if (rst) begin
            addr <= 10'd0;
        end else begin
            addr <= addr + 10'd1;
        end
    end

    // Instantiate Denoising Autoencoder (DAE)
    dae_model dae_inst (
        .clk(clk),
        .noisy_signal(noisy_signal),
        .w_enc1_0(8'd3), .w_enc1_1(8'd2), .w_enc1_2(-8'd1), .w_enc1_3(-8'd2),
        .b_enc1_0(8'd2), .b_enc1_1(8'd1), .b_enc1_2(8'd0), .b_enc1_3(-8'd1),
        .w_enc2_0(8'd2), .w_enc2_1(-8'd1),
        .b_enc2_0(8'd1), .b_enc2_1(8'd0),
        .w_dec1_0(8'd2), .w_dec1_1(-8'd1),
        .b_dec1_0(8'd1), .b_dec1_1(8'd0),
        .w_dec2_0(8'd1), .w_dec2_1(-8'd1), .w_dec2_2(8'd2), .w_dec2_3(-8'd2),
        .b_dec2_0(8'd2), .b_dec2_1(8'd0), .b_dec2_2(-8'd1), .b_dec2_3(8'd1),
        .clean_signal0(clean_signal0),
        .clean_signal1(clean_signal1),
        .clean_signal2(clean_signal2),
        .clean_signal3(clean_signal3)
    );

endmodule
