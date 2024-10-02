module comparators #(parameter N = 8)
                    (input [N-1:0] a, b,
                     input [3-1:0] comp_control,
                     output wire [N-1:0] f);
    
    // eq = (a == b) // 000 00000000
    // neq = (a !== b) // 001 00000001
    // lt = (a < b) // 010 00000010
    // lte = (a <= b) // 011 00000011
    // gt = (a > b) // 100 00000100
    // gte = (a >= b) // 101 00000101

    assign f = (comp_control == 3'b000 && a == b) ? 8'b00000000 :
               (comp_control == 3'b001 && a !== b) ? 8'b00000001 :
               (comp_control == 3'b010 && a < b) ? 8'b00000010 :
               (comp_control == 3'b011 && a <= b) ? 8'b00000011 :
               (comp_control == 3'b100 && a > b) ? 8'b00000100 :
               (comp_control == 3'b101 && a >= b) ? 8'b00000101 :
               8'b11111111;
endmodule