module alu_decoder (output [3-1:0] alu_control,
                    input alu_op[2-1:0],
                    input [3-1:0] funct3,
                    input [2-1:0] funct7);

    always @* begin
        case (alu_op)
            2'b00: // lw, sw
                begin
                    alu_control = 3'b000; // add
                end
            2'b01: // beq
                begin
                    alu_control = 3'b001; // subtract
                end
            2'b10: // add
                case (funct3)
                    3'b000: // add for funct7 == 00, 01, 10; subtract for funct7 == 11
                        alu_control = (funct7 == 2'b00 || funct7 == 2'b01 || funct7 == 2'b10) ? 2'b000 : 2'b001; 
                    3'b010:
                        alu_control = 3'b101; // set less than
                    3'b110:
                        alu_control = 3'b011; // or
                    3'b111:
                        alu_control = 3'b010; // and
                endcase
        endcase
    end
endmodule