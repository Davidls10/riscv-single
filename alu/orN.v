module orN #(parameter N = 8)
            (output logic [N-1:0] f,
             input logic [N-1:0] a, b);

    assign f = a | b;
endmodule