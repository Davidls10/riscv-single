`include "alu_decoder.v"

module alu_decoder_tb;
    wire [3-1:0] alu_control_out;
    reg [2-1:0] alu_op_in;
    reg [3-1:0] funct3_in;
    reg [2-1:0] funct7_in;

    alu_decoder uut(alu_control_out, alu_op_in, funct3_in, funct7_in);

    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, alu_decoder_tb);

        alu_op_in = 2'b00;
        #5 if (alu_control_out !== 3'b000) $display ("Alu decoder failed!");

        alu_op_in = 2'b01;
        #5 if (alu_control_out !== 3'b001) $display ("Alu decoder failed!");

        alu_op_in = 2'b10; funct3_in = 3'b000; funct7_in = 2'b00;
        #5 if (alu_control_out !== 3'b000) $display ("Alu decoder failed!");

        alu_op_in = 2'b10; funct3_in = 3'b000; funct7_in = 2'b01;
        #5 if (alu_control_out !== 3'b000) $display ("Alu decoder failed!");

        alu_op_in = 2'b10; funct3_in = 3'b000; funct7_in = 2'b10;
        #5 if (alu_control_out !== 3'b000) $display ("Alu decoder failed!");

        alu_op_in = 2'b10; funct3_in = 3'b000; funct7_in = 2'b11;
        #5 if (alu_control_out !== 3'b001) $display ("Alu decoder failed!");

        alu_op_in = 2'b10; funct3_in = 3'b010;
        #5 if (alu_control_out !== 3'b101) $display ("Alu decoder failed!");

        alu_op_in = 2'b10; funct3_in = 3'b110;
        #5 if (alu_control_out !== 3'b011) $display ("Alu decoder failed!");

        alu_op_in = 2'b10; funct3_in = 3'b111;
        #5 if (alu_control_out !== 3'b010) $display ("Alu decoder failed!");

        #5 $finish;
    end
endmodule