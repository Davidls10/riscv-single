`include "full_adder.v"

module full_adder_tb;
    wire s, cout;
    reg a, b, cin;

    full_adder fa1(s, cout, a, b, cin);
    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, full_adder_tb);
        a = 0; b = 0; cin = 0;
        #5 a = 0; b = 0; cin = 1;
        #5 a = 0; b = 1; cin = 0;
        #5 a = 0; b = 1; cin = 1;
        #5 a = 1; b = 0; cin = 0;
        #5 a = 1; b = 0; cin = 1;
        #5 a = 1; b = 1; cin = 0;
        #5 a = 1; b = 1; cin = 1;
        #5 $finish;
    end
endmodule