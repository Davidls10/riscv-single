`include "../full_adder/full_adder.v"

module adder8(output [8-1:0] f, 
             output cout,
             input [8-1:0] a, b);

    half_adder s0(f[0], cout0, a[0], b[0]);
    full_adder s1(f[1], cout1, a[1], b[1], cout0);
    full_adder s2(f[2], cout2, a[2], b[2], cout1);
    full_adder s3(f[3], cout3, a[3], b[3], cout2);
    full_adder s4(f[4], cout4, a[4], b[4], cout3);
    full_adder s5(f[5], cout5, a[5], b[5], cout4);
    full_adder s6(f[6], cout6, a[6], b[6], cout5);
    full_adder s7(f[7], cout, a[7], b[7], cout6);
endmodule