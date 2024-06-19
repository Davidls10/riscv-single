`include "bubble_sort.v"

module bubble_sort_tb;
    wire [8-1:0] f;
    reg [8-1:0] a;

    bubble_sort b1(f, a);

    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, bubble_sort_tb);
        my_arra
        a = 3'b101; e = 0;
        #5 if (f !== 8'b00000000) $display ("Decoder failed!");
        a = 3'b000; e = 1;
        #5 if (f !== 8'b00000001) $display ("Decoder failed!");
        a = 3'b001; e = 1;
        #5 if (f !== 8'b00000010) $display ("Decoder failed!");
        a = 3'b010; e = 1;
        #5 if (f !== 8'b00000100) $display ("Decoder failed!");
        a = 3'b011; e = 1;
        #5 if (f !== 8'b00001000) $display ("Decoder failed!");
        a = 3'b100; e = 1;
        #5 if (f !== 8'b00010000) $display ("Decoder failed!");
        a = 3'b101; e = 1;
        #5 if (f !== 8'b00100000) $display ("Decoder failed!");
        a = 3'b110; e = 1;
        #5 if (f !== 8'b01000000) $display ("Decoder failed!");
        a = 3'b111; e = 1;
        #5 if (f !== 8'b10000000) $display ("Decoder failed!");
        #5 $finish;
    end
endmodule