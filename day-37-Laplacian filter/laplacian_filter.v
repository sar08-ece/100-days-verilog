
`timescale 1ns/1ps

module laplacian_filter #(
    parameter IMG_W = 256
)(
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  pixel_in,    // input grayscale pixel stream
    input  wire        pixel_valid, // input pixel valid
    output reg  [7:0]  pixel_out,   // output Sobel magnitude
    output reg         out_valid    // output valid
);

    // ----------------------------------------------------
    // Line buffers (2 rows)
    // ----------------------------------------------------
    reg [7:0] linebuf1 [0:IMG_W-1];
    reg [7:0] linebuf2 [0:IMG_W-1];

    // Sliding window registers
    reg [7:0] w00,w01,w02;
    reg [7:0] w10,w11,w12;
    reg [7:0] w20,w21,w22;

    // Column and row counters
    reg [8:0] col;
    reg [8:0] row;
    
    // Sobel intermediate variabless
    integer sum;
    // Main process
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            col <= 0;
            row <= 0;
            pixel_out <= 0;
            out_valid <= 0;
        end else if (pixel_valid) begin
            // Shift window left
            w00 <= w01; w01 <= w02; w02 <= linebuf2[col];
            w10 <= w11; w11 <= w12; w12 <= linebuf1[col];
            w20 <= w21; w21 <= w22; w22 <= pixel_in;

            // Update line buffers
            linebuf2[col] <= linebuf1[col];
            linebuf1[col] <= pixel_in;

            // Update counters
            if (col == IMG_W-1) begin
                col <= 0;
                row <= row + 1;
            end else begin
                col <= col + 1;
            end

            // Compute Sobel only after first 2 rows/cols
            if (row > 1 && col > 1) begin
               sum=-w01+(w11<<2)-w10-w12-w21;
               if(sum<0)sum=0;
               if(sum>255)sum=255;
               pixel_out<=sum[7:0];
               out_valid<=1;
               end else begin
                pixel_out <= 0;
                out_valid <= 0;
            end
        end
    end
endmodule
