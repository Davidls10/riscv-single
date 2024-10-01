`include "main_decoder.v"

module main_decoder_tb;
    wire reg_write;
    wire imm_src;
    wire alu_src;
    wire mem_write;
    wire result_src;
    wire branch;
    wire alu_op;
    reg [7-1:0] opcode;

    main_decoder uut(opcode, reg_write, imm_src, alu_src, 
                    mem_write, result_src, branch, alu_op);

    initial begin
        $dumpfile("file.vcd");
        $dumpvars(0, main_decoder_tb);

        opcode = 7'b0000011;
        #5 if (reg_write !== 1'b1 && imm_src !== 2'b00 && alu_src !== 1'b1 && 
               mem_write !== 1'b0 && result_src !== 1'b1 && branch !== 1'b0 && 
               alu_op !== 2'b00) 
        $display ("lw failed!");

        opcode = 7'b0100011;
        #5 if (reg_write !== 1'b0 && imm_src !== 2'b01 && alu_src !== 1'b1 && 
               mem_write !== 1'b1 && result_src !== 1'bX && branch !== 1'b0 && 
               alu_op !== 2'b00) 
        $display ("sw failed!");

        opcode = 7'b0110011;
        #5 if (reg_write !== 1'b1 && imm_src !== 2'bXX && alu_src !== 1'b0 && 
               mem_write !== 1'b0 && result_src !== 1'b0 && branch !== 1'b0 && 
               alu_op !== 2'b10) 
        $display ("R-type failed!");

        opcode = 7'b1100011;
        #5 if (reg_write !== 1'b0 && imm_src !== 2'b10 && alu_src !== 1'b0 && 
               mem_write !== 1'b0 && result_src !== 1'bX && branch !== 1'b1 && 
               alu_op !== 2'b01) 
        $display ("beq failed!");

        #5 $finish;
    end
endmodule