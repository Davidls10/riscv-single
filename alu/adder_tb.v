`include "adder.v"

module adder_tb;
    wire [8-1:0] f;
    wire cout;
    reg [8-1:0] a, b;

    adder ad1(f, cout, a, b);
    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, adder_tb);
        a = 8'b00001100; b = 8'b00000011;
        #5 if (f !== 8'b00001111 && cout !== 0) $display ("Sum 0b00001100 with 0b00000011 failed!");
        a = 8'b00001111; b = 8'b01011010;
        #5 if (f !== 8'b01100110 && cout !== 0) $display ("Sum 0b00001111 with 0b01011010 failed!");
        a = 8'b11111111; b = 8'b11000000;
        #5 if (f !== 8'b10000000 && cout !== 1) $display ("Sum 0b11111111 with 0b00000000 failed!");
        a = 8'b00000001; b = 8'b00000001;
        #5 if (f !== 8'b00000010 && cout !== 0) $display ("Sum 0b00000001 with 0b00000001 failed!");
        #5 $finish;
    end
endmodule