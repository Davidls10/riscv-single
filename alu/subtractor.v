module subtractor #(parameter N = 8)
                   (output wire [N-1:0] y,
                    input [N-1:0] a, b);
    
    assign y = a - b;
endmodule