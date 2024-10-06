module alu_decoder (output reg [3-1:0] alu_control,
                    input [2-1:0] alu_op,
                    input [3-1:0] funct3,
                    input [7-1:0] funct7);

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
                        alu_control = (funct7 == 7'b0000000 || funct7 == 7'b0100000 || funct7 == 7'b1000000) ? 3'b000 : 3'b001; 
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