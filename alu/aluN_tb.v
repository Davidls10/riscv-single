`include "aluN.v"

module aluN_tb;
    wire [8-1:0] f;
    reg [8-1:0] a, b;
    reg [2-1:0] ALUControl;

    aluN alu1(.ALUResult(f), .SrcA(a), .SrcB(b), .ALUControl(ALUControl));

    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, aluN_tb);
        ALUControl = 2'b00; a = 8'b00001100; b = 8'b00001100; // sum test 00001100 + 00001100 = 00011000
        #5 if (f !== 8'b00011000) $display ("Fail 1");
        ALUControl = 2'b01; a = 8'b00001100; b = 8'b00000001; // sub test 00001100 - 00000001 = 00001011
        #5 if (f !== 8'b00001011) $display ("Fail 2");
        ALUControl = 2'b10; a = 8'b00001100; b = 8'b00101101; // and test 00001100 & 00101101 = 00001100
        #5 if (f !== 8'b00001100) $display ("Fail 3");
        ALUControl = 2'b11; a = 8'b01001100; b = 8'b00001100; // or test 01001100 | 00001100 = 01001100
        #5 if (f !== 8'b01001100) $display ("Fail 4");
        #5 $finish;
    end

endmodule