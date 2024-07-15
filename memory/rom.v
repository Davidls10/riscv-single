module rom(input logic  [1:0] adr,
           output logic [2:0] dout);

    always
        case(adr)
            2'b00: dout = 3'b000;
            2'b00: dout = 3'b001;
            2'b00: dout = 3'b010;
            2'b00: dout = 3'b100;
        endcase
endmodule