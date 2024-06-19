`include "comparer.v"

module comparer_tb;
    wire [3-1:0] f;
    reg [8-1:0] a, b;

    comparer c1(f, a, b);

    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, comparer_tb);
        a = 8'b00000000; b = 8'b00000000;
        #5 if (f !== 3'b001) $display ("Comparison between 0b00000000 and 0b00000000 failed!");
        a = 8'b11111111; b = 8'b11111111;
        #5 if (f !== 3'b001) $display ("Comparison between 0b11111111 and 0b11111111 failed!");
        a = 8'b01111111; b = 8'b10000000;
        #5 if (f !== 3'b010) $display ("Comparison between 0b01111111 and 0b10000000 failed!");
        a = 8'b00000001; b = 8'b00000000;
        #5 if (f !== 3'b100) $display ("Comparison between 0b00000001 and 0b00000000 failed!");
        #5 $finish;
    end
endmodule