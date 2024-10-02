`include "comparators.v"

module comparators_tb;
    wire [8-1:0] f;
    reg [8-1:0] a, b;
    reg [3-1:0] comp_control;

    comparators cmp1(.f(f), .a(a), .b(b), .comp_control(comp_control));

    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, comparators_tb);
        comp_control = 3'b000; a = 8'b00001100; b = 8'b00001100;
        #5 if (f !== 8'b00000000) $display ("Fail 1");
        comp_control = 3'b000; a = 8'b00001101; b = 8'b00001100;
        #5 if (f !== 8'b11111111) $display ("Fail 2");
        comp_control = 3'b010; a = 8'b00001100; b = 8'b00101101;
        #5 if (f !== 8'b00000010) $display ("Fail 3");
        comp_control = 3'b101; a = 8'b01001100; b = 8'b00001100;
        #5 if (f !== 8'b00000101) $display ("Fail 4");
        #5 $finish;
    end

endmodule