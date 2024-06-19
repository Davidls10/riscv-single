`include "decoder.v"

module decoder_tb;
    wire [8-1:0] f;
    reg [3-1:0] a;
    reg e;

    decoder d1(f, e, a);

    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, decoder_tb);
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