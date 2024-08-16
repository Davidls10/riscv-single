module rom(input logic  [1:0] adr,
           output logic [2:0] dout);

    always
        case(adr)
            2'b00: dout = 3'b000;
            2'b01: dout = 3'b001;
            2'b10: dout = 3'b010;
            2'b11: dout = 3'b100;
        endcase
endmodule