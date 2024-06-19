module mux8(output [8-1:0] y,
            input [8-1:0] d0, d1, d2, d3,
            input [1:0] s);
        
    assign y = s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0);
endmodule