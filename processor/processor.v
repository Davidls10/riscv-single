module processor(output pc_out, alu_result,
                 input clk, reset
                );

    reg [15:0] current_pc;
    wire signed [15:0] pc_next;

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_current <= 16'd0;
        else 
            pc_current <= pc_next;
    end

    register_file reg_file(.clk(clk), .we3(we3),
                           .a1(reg_read_addr_1), .a2(reg_read_addr_2), 
                           .a3(reg_write_addr), .wd3(reg_write_data),
                           .rd1(reg_read_data_1), .rd2(reg_read_data_2));

endmodule