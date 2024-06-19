module bubble_sort #(parameter N = 8)
                    (output reg [N-1:0] y,
                     input [N-1:0] a);
    
    integer i, swapped, temp;

    always @* begin
        y = a;
        swapped = 1; // to start the while loop

        while (swapped) begin
            swapped = 0;
            for (i = 0; i <= N - 2; i = i + 1) begin
                if (y[i] > y[i + 1]) begin
                    temp = y[i];
                    y[i] = y[i+1];
                    y[i+1] = temp;
                    swapped = 1;
                end
            end
        end
    end

endmodule