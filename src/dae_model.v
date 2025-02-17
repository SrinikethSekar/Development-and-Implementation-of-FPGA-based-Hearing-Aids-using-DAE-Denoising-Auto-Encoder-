module dae_model (
    input wire clk,
    input wire signed [7:0] noisy_signal,
    input wire signed [7:0] w_enc1_0, w_enc1_1, w_enc1_2, w_enc1_3,
    input wire signed [7:0] b_enc1_0, b_enc1_1, b_enc1_2, b_enc1_3,
    input wire signed [7:0] w_enc2_0, w_enc2_1,
    input wire signed [7:0] b_enc2_0, b_enc2_1,
    input wire signed [7:0] w_dec1_0, w_dec1_1,
    input wire signed [7:0] b_dec1_0, b_dec1_1,
    input wire signed [7:0] w_dec2_0, w_dec2_1, w_dec2_2, w_dec2_3,
    input wire signed [7:0] b_dec2_0, b_dec2_1, b_dec2_2, b_dec2_3,
    output wire signed [7:0] clean_signal0,
    output wire signed [7:0] clean_signal1,
    output wire signed [7:0] clean_signal2,
    output wire signed [7:0] clean_signal3
);

    wire signed [7:0] feature0, feature1;

    // Encoder Module (2 Features from Noisy Input)
    encoder enc (
        .clk(clk),
        .input_signal(noisy_signal),
        .w1_0(w_enc1_0), .w1_1(w_enc1_1), .w1_2(w_enc1_2), .w1_3(w_enc1_3),
        .b1_0(b_enc1_0), .b1_1(b_enc1_1), .b1_2(b_enc1_2), .b1_3(b_enc1_3),
        .w2_0(w_enc2_0), .w2_1(w_enc2_1),
        .b2_0(b_enc2_0), .b2_1(b_enc2_1),
        .feature0(feature0),
        .feature1(feature1)
    );

    // Decoder Module (Reconstruct Clean Signal from Features)
    decoder dec (
        .clk(clk),
        .feature0(feature0),
        .feature1(feature1),
        .w3_0(w_dec1_0), .w3_1(w_dec1_1),
        .b3_0(b_dec1_0), .b3_1(b_dec1_1),
        .w4_0(w_dec2_0), .w4_1(w_dec2_1), .w4_2(w_dec2_2), .w4_3(w_dec2_3),
        .b4_0(b_dec2_0), .b4_1(b_dec2_1), .b4_2(b_dec2_2), .b4_3(b_dec2_3),
        .output0(clean_signal0),
        .output1(clean_signal1),
        .output2(clean_signal2),
        .output3(clean_signal3)
    );

endmodule
