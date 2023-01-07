`timescale 1ns / 1ps

module ALU( 
input signed [31:0]operand1, operand2,
input signed[3:0] opcode,
output reg [31:0]result
);
parameter topla=4'b0000;
parameter cikar=4'b0001;
parameter carp=4'b0010;
parameter AND=4'b0011;
parameter OR=4'b0100;
parameter XOR=4'b0110;
parameter NOT=4'b0111;
parameter SRL=4'b1000;
parameter SLL=4'b1001;
    
always@(opcode,operand1,operand2)begin

case(opcode)
    topla:result <= operand1 + operand2; 
    
    cikar:result <= operand1 - operand2; 
    
    carp:result <= operand1 * operand2; 
    
    AND:result <= operand1 & operand2;
    
    OR:result <= operand1 | operand2;
    
    XOR:result <= operand1 ^ operand2;
    
    NOT:result <= ~operand1;
    
    SRL:result <= operand1 >> operand2;
    
    SLL:result <= operand1 << operand2;
endcase

end
endmodule

module TB();
reg[31:0]operand1,operand2;
reg[3:0]opcode;
wire[31:0]result;

ALU uut ( 
        .operand1(operand1) , 
        .operand2(operand2), 
        .opcode (opcode ), 
        .result(result)
    );    
ALU a1(operand1,operand2,opcode,result);
initial begin
    opcode = 4'b0000;
    operand1  = 32'b00000000000000000000000000011001;
    operand2  = 32'b00000000000000000000000000011001;
    #10;
    opcode = 4'b0001;
    operand1  = 32'b00000000000000000000000000011001;
    operand2  = 32'b00000000000000000000000000011001;
    #10
    opcode = 4'b0010;
    operand1  = 32'b00000000000000000000000000011001;
    operand2  = 32'b00000000000000000000000000011001;
    #10
    opcode = 4'b0011;
    operand1  = 32'b00000000000000000000000000011001;
    operand2  = 32'b00000000000000000000000000011001;
    #10
    opcode = 4'b0100;
    operand1  = 32'b00000000000000000000000000011001;
    operand2  = 32'b00000000000000000000000000011001;
    #10
    opcode = 4'b0110;
    operand1  = 32'b00000000000000000000000000011001;
    operand2  = 32'b00000000000000000000000000011001;
    #10
    opcode = 4'b0111;
    operand1  = 32'b00000000000000000000000000011001;
    operand2  = 32'b00000000000000000000000000011001;
    #10
    opcode = 4'b1000;
    operand1  = 32'b00000000000000000000000000011001;
    operand2  = 32'b00000000000000000000000000011001;
    #10
    opcode = 4'b1001;
    operand1  = 32'b00000000000000000000000000011001;
    operand2  = 32'b00000000000000000000000000011001;
    #10;
end  

endmodule 
