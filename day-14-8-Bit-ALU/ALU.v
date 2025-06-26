module ALU_1(input [7:0]A,B,
input [3:0]sel,
output reg [7:0]result,
output reg carry,
output reg zero,negative,overflow
);

reg [8:0]temp;

always @(*)begin
    case(sel)
        //ARITHMETIC OPERATIONS
        4'b0000: begin           //ADD
            temp=A+B;
            result=temp[7:0];
            carry=temp[8];
        end
        4'b0001:begin            //SUB
            temp=A-B;
            result=temp[7:0];
            carry=temp[8];
        end
        4'b0010:                //INC
        begin
            result=A+1;
            carry=(A==8'b11111111);
        end
        4'b0011:                //DEC
        begin
            result=A-1;
            carry=(A==8'b00000000);
        end
        //LOGICAL OPERATIONS
        4'b0100:
        begin
            result=A&B;
        end
        4'b0101:
        begin
            result=A|B;
        end
        4'b0110:
        begin
            result=A^B;
        end
        4'b0111:
        begin
            result=~A;
        end
        
        //shifting and  operations
        4'b1000:  result=A<<1;
        4'b1001: result=A>>1;
        4'b1010: result={A[6:0],A[7]}; //shift left MSB to LSB
        4'b1011: result={A[0],result[7:1]}; //shift right LSB to MSB
        
        //status flags
        4'b1100:  result=(A==B)?8'b00000001:8'b00000000;
        4'b1101:  result=(A<B)?8'b00000000:8'b00000001;
        4'b1110:  result=(A>B)?8'b00000001:8'b00000000;
        4'b1111: result=8'b00000000;
        default: result=8'b00000000;
endcase
zero=(result==8'b00000000);
negative=result[7]; //IF MSB ==1
end
endmodule
