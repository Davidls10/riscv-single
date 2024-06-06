`include "../half_adder/half_adder.v"

module full_adder(s, cout, a, b, cin);
    output s, cout;
    input a, b, cin;

    half_adder h1(s1, cout1, a, b), h2(s, cout2, s1, cin);
    or g1(cout, cout1, cout2);
endmodule
    