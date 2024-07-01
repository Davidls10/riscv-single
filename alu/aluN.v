module aluN#(parameter N = 8)
           (output y,
            input [N-1:0] a, b;
            input [1:0] ALU_control);

    adder add1(sum, a, b);
    subtractor sub1(sub, a, b);
    and and1(y_and, a, b);
    or or1(y_or, a, b);
    comparators comp1(eq, neq, lt, lte, gt, gte, a, b);
    mux8 mux1(f, a, b, ALU_control);
endmodule