`include "adder.v"
`include "subtractor.v"
`include "andN.v"
`include "orN.v"
`include "comparators.v"
`include "mux8.v"

module aluN#(parameter N = 8)
           (output [N-1:0] ALUResult,
            input [N-1:0] SrcA, SrcB,
            input [1:0] ALUControl);

    wire [N-1:0] sum;
    wire [N-1:0] sub;
    wire [N-1:0] y_and;
    wire [N-1:0] y_or;

    adder add1(.f(sum), .cout(cout), .a(SrcA), .b(SrcB)); // 00
    subtractor sub1(sub, SrcA, SrcB); // 01
    andN and1(y_and, SrcA, SrcB); // 10
    orN or1(y_or, SrcA, SrcB); // 11
    mux8 mux8_1(ALUResult, sum, sub, y_and, y_or, ALUControl);
endmodule