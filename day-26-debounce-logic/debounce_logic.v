module debounce #(parameter W=3)(input clock,reset,
input raw_in,
output reg clean_out);

reg [W-1:0]counter=0;
reg sync_0,sync_1;
reg stable_state;   //stable state

always @(posedge clock)begin
    if(reset)begin
        sync_0<=0;
        sync_1<=0;
    end
    else
    begin
        sync_0<=raw_in;
        sync_1<=sync_0;
    end
end

always @(posedge clock)begin
    if(reset)begin
        counter<=0;
        stable_state<=0;
        clean_out<=0;
    end
    else begin
        if(sync_1==stable_state)begin
            if(counter<{W{1'b1}})begin
                counter<=counter+1;
            end
            else
            begin
                clean_out<=stable_state;
            end
        end
        else begin
            counter<=0;
            stable_state<=sync_1;
        end
    end
end
endmodule