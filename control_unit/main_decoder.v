module main_decoder (input [7-1:0] opcode,
                     output reg_write,
                     output imm_src,
                     output alu_src,
                     output mem_write,
                     output result_src,
                     output branch,
                     output alu_op,
                    );

    always @* begin
        case (opcode)
            7'b0000011: // lw
                begin
                    reg_write = 1'b1;
                    imm_src = 2'b00;
                    alu_src = 1'b1;
                    mem_write = 1'b0;
                    result_src = 1'b1;
                    branch = 1'b0;
                    alu_op = 2'b00;
                end
            7'b0100011: // sw
                begin
                    reg_write = 1'b0;
                    imm_src = 2'b01;
                    alu_src = 1'b1;
                    mem_write = 1'b1;
                    result_src = 1'bX;
                    branch = 1'b0;
                    alu_op = 2'b00;
                end
            7'b0100011: // R-type
                begin
                    reg_write = 1'b1;
                    imm_src = 2'bXX;
                    alu_src = 1'b0;
                    mem_write = 1'b0;
                    result_src = 1'b0;
                    branch = 1'b0;
                    alu_op = 2'b10;
                end
            7'b0100011: // beq
                begin
                    reg_write = 1'b0;
                    imm_src = 2'b10;
                    alu_src = 1'b0;
                    mem_write = 1'b0;
                    result_src = 1'bX;
                    branch = 1'b1;
                    alu_op = 2'b01;
                end
        endcase
    end

endmodule