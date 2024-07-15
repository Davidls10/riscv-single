// 32-bit representantion
// [31:31] sign, [30:23] exponent, [22:0] mantissa

// IEEE 754:
// 0           sign: X, exponent: 00000000, mantissa:  00000000000000000000000
// +infinite   sign: 0, exponent: 11111111, mantissa:  00000000000000000000000
// -infinite   sign: 1, exponent: 11111111, mantissa:  00000000000000000000000
// NaN         sign: X, exponent: 11111111, mantissa:  Non-zero

module basic_fpu(output [32-1:0] res,
                 input [32-1:0] n1,
                 input [32-1:0] n2);
    
    n1 = 
endmodule