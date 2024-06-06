module mux(f, a, b, sel);
    output f;
    input a, b, sel;

    and g1(f1, a, n_sel),
        g2(f2, b, sel);
    not g4(n_sel, sel);
    or  g3(f, f1, f2);
endmodule