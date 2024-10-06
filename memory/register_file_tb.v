`include "register_file.v"

module register_file_tb;
    reg clk, we;
    reg [5-1:0] a1, a2, a3;
    reg [32-1:0] wd3;
    wire [32-1:0] rd1, rd2; 

    register_file rg1(.clk(clk), .we(we), .a1(a1), .a2(a2), .a3(a3),
                      .rd1(rd1), .rd2(rd2), .wd3(wd3));

    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, register_file_tb);
    end

    initial begin
        // reading reg_file[9]
        clk = 0; we = 0; a1 = 9; a2 = 0; a3 = 9; wd3 = 0;
        #5 clk = 1;
        $display($time, " Writing data = %d    reg_file[%d] = %d    reg_file[%d] = %d", wd3, a1, rd1, a2, rd2);

        // writing 10 in reg_file[9]
        clk = 0; we = 1; a1 = 0; a2 = 0; a3 = 9; wd3 = 32'd10;
        #5 clk = 1;
        $display($time, " Writing data = %d    reg_file[%d] = %d    reg_file[%d] = %d", wd3, a1, rd1, a2, rd2);

        // reading reg_file[9] in a1 address
        #5 clk = 0; we = 0; a1 = 9; a2 = 0; a3 = 0; wd3 = 32'd10;
        #5 clk = 1;
        $display($time, " Writing data = %d    reg_file[%d] = %d    reg_file[%d] = %d", wd3, a1, rd1, a2, rd2);

        #5 $finish;
    end


endmodule