module processor(output pc_out, alu_result,
                 input clk, reset
                );

    reg [31:0] pc_current;
    wire signed [31:0] pc_next;
    wire [31:0] pc_target;
    wire [31:0] instruction;
    wire [1:0] reg_dst, mem_to_reg, alu_op;
    wire [2:0] alu_control;
    wire [31:0] alu_out;
    wire zero_flag;


    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_current <= 16'd0;
        else 
            pc_current <= pc_next;
    end

    // program counter + 4
    assign pc_plus_4 = pc_current + 32'd4;


    // instruction memory
    instruction_memory instr_mem(.pc(pc_current), .instr(instruction));


    // control unit
    main_decoder main_dec(.opcode(instruction[6:0]), .reg_write(RegWrite), 
                          .imm_src(ImmSrc), .alu_src(AluSrc), 
                          .mem_write(MemWrite), .result_src(ResultSrc), 
                          .branch(Branch), .alu_op(ALUOp));

    alu_decoder alu_dec(.alu_control(ALUControl),
                        .alu_op(ALUOp),
                        .funct3(instruction[14:12]),
                        .funct7(instruction[31:25]));


    // extend unit
    extend ext(.imm_ext(imm_ext), .imm_src(imm_src), .instr(instruction[31:7]));


    wire reg_read_addr_1 = instruction[19:15];
    wire reg_read_addr_2 = instruction[24:20];
    wire reg_write_addr = instruction[11:7];

    // operations on register file
    register_file reg_file(.clk(clk), .we3(we3),
                           .a1(reg_read_addr_1), .a2(reg_read_addr_2), 
                           .a3(reg_write_addr), .wd3(reg_write_data),
                           .rd1(reg_read_data_1), .rd2(reg_read_data_2));

    
    assign alu_result = alu_out;
endmodule