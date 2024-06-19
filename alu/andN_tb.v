`include "andN.v"

module andN_tb;
    wire [8-1:0] f;
    reg [8-1:0] a, b;

    andN and1(f, a, b);
    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, andN_tb);
        a = 8'b00000000; b = 8'b00000000;
        #5 if (f !== 8'b00000000) $display ("0b00000000 & 0b00000000 failed!");
        a = 8'b00001111; b = 8'b01011010;
        #5 if (f !== 8'b00001010) $display ("0b00001111 & 0b01011010 failed!");
        a = 8'b11111111; b = 8'b00000000;
        #5 if (f !== 8'b00000000) $display ("0b11111111 & 0b00000000 failed!");
        a = 8'b00000001; b = 8'b00000001;
        #5 if (f !== 8'b00000001) $display ("0b00000001 & 0b00000001 failed!");
        #5 $finish;
    end
endmodule
