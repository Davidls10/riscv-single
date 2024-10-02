module orN #(parameter N = 8)
            (output wire [N-1:0] f,
             input [N-1:0] a, b);

    assign f = a | b;
endmodule