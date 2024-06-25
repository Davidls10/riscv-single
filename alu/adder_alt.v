`include "../full_adder/full_adder.v"

module adder_alt #(parameter N = 8)
              (output wire [N-1:0] f,
               output wire cout,
               input wire [N-1:0] a,
               input wire [N-1:0] b);

    wire [N-2:0] carry;

    full_adder s[N-1:0] ( 
        .s(f), .cout( {cout, carry} ), .a(a), .b(b), .cin( {carry, 1'b0} ) 
    );
endmodule