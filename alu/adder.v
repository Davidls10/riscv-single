`include "../full_adder/full_adder.v"

module adder#(parameter N = 8)
             (output wire [N-1:0] f, 
              output wire cout,
              input wire [N-1:0] a, b);

    wire [N:0] carry;

    genvar i;

    assign carry[0] = 0;

    generate
        for (i = 0; i < N; i = i + 1) begin
            full_adder s(f[i], carry[i+1], a[i], b[i], carry[i]);
        end
    endgenerate

    assign cout = carry[N];
endmodule