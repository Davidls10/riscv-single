`include "mux.v"
`timescale 1ns/100ps

module mux_tb;
    wire f;
    reg a, b, sel;

    mux m1(f, a, b, sel);
    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, mux_tb);

        a = 0; b = 0; sel = 0;
        #5 a = 0; b = 0; sel = 1;
        #5 a = 0; b = 1; sel = 0;
        #5 a = 0; b = 1; sel = 1;
        #5 a = 1; b = 0; sel = 0;
        #5 a = 1; b = 0; sel = 1;
        #5 a = 1; b = 1; sel = 0;
        #5 a = 1; b = 1; sel = 1;
        #5 finish;
    end
endmodule
