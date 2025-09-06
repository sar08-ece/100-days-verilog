module IMG_BW_tb;
    parameter W=256;
    parameter H=256;
    reg [7:0]pixel;
    wire [7:0]bw_pixel;
    reg [7:0]image[0:65535];
    integer i;
    integer out_file;
    
    integer fout;
    IMG_BG #(.W(W),.H(H)) u1(.pixel_in(pixel),.bw_out(bw_pixel));
    
    initial begin
        //loading the file
        $readmemh("image.hex",image);
        
        fout=$fopen("D:/modelsim_ae/examples/bw_output.hex","w");
        
        for(i=0;i<65536;i=i+1)begin
            pixel=image[i];
            #1;
            $fwrite(fout,"%02h\n",bw_pixel);
        end
        
        $fclose(fout);
        
        $display("Conversion done!!");
        $finish;
    end
endmodule
    
    
    
