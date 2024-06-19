module comparer #(parameter N = 8)
                 (output reg [2:0] f, // if f[2] == 1 -> a > b; if f[1] == 1 -> a < b; if f[0] == 1 -> a == b
                  input [N-1:0] a, b);
    
    integer i;

    always @* begin
        f = 3'b000;
        i = N - 1;
        while (i > 0 && (a[i] == b[i])) begin
            i = i - 1;
        end

        i = (a[i] > b[i]) ? 2 : ((a[i] < b[i]) ? 1 : 0);
        f[i] = 1;
    end

endmodule