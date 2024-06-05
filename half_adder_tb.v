`include "half_adder.v"
`timescale 1ns/100ps

module half_adder_tb;
    wire s, c;
    reg a, b;
    
    half_adder h1(a, b, s, c);
    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, half_adder_tb);
        a = 0; b = 0;
        #5 a = 0; b = 1;
        #5 a = 1; b = 0;
        #5 a = 1; b = 1;
        #5 $display("s = %d c = %d", s, c);
    end
endmodule