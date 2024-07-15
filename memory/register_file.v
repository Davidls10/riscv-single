module regfile #(parameter N = 6,  M = 32, L = 32)
                (input clk,
                 input we3,
                 input [N-1:0] a1, a2, a3,
                 input [M-1:0] wd3,
                 output [M-1:0] rd1, rd2);

    [M-1:0] rf [L-1:0];

    always @(posedge clk)
        if (we3) rf[a3] <= wd3;

    assign rd1 = (a1 != 0) ? rf[a1] : 0;
    assign rd2 = (a2 != 0) ? rf[a2] : 0;
endmodule