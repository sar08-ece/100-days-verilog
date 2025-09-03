`timescale 1ns/1ps

module sobel_tb;

    reg clk, rst;
    reg [7:0] pixel_in;
    reg pixel_valid;
    wire [7:0] pixel_out;
    wire out_valid;

    // Instantiate DUT
    sobel_filter #(.IMG_W(256)) dut (
        .clk(clk),
        .rst(rst),
        .pixel_in(pixel_in),
        .pixel_valid(pixel_valid),
        .pixel_out(pixel_out),
        .out_valid(out_valid)
    );

    // Clock
    always #5 clk = ~clk;

    // Image memory
    reg [7:0] img_mem [0:65535];     // 256x256 = 65536
    integer i;

    // Output file handle
    integer fout;

    initial begin
        clk = 0; rst = 1; pixel_in = 0; pixel_valid = 0;
        fout = $fopen("edge_out.hex","w");
        if(!fout) begin
            $display("? Could not open output file.");
            $finish;
        end

        #20 rst = 0;

        // Load input image (hex file: 65536 lines of 8-bit hex)
        $readmemh("image.hex", img_mem);

        // Feed pixels one by one
        for (i=0; i<65536; i=i+1) begin
            @(posedge clk);
            pixel_in    <= img_mem[i];
            pixel_valid <= 1;
        end

        // Wait a little after feeding all pixels
        repeat(50) @(posedge clk);

        $fclose(fout);
        $finish;
    end

    // ? Capture DUT output (streaming)
    always @(posedge clk) begin
        if (out_valid) begin
            $fwrite(fout, "%02h\n", pixel_out);
        end
    end

endmodule
