`include "../instruction_memory/instruction_memory.v"
`include "../control_unit/main_decoder.v"
`include "../control_unit/alu_decoder.v"
`include "../extend/extend.v"
`include "../memory/register_file.v"
`include "../alu/aluN.v"
`include "../memory/data_memory.v"

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
    wire [31:0] result;


    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_current <= 16'd0;
        else 
            pc_current <= pc_next;
    end

    // program counter + 4
    assign pc_plus_4 = pc_current + 32'd4;


    // instruction memory
    /**
    * The instruction memory contains the instructions of the program that will run
    */
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
    /**
    * The extend unit extends the signal or add zeros
    */
    extend ext(.imm_ext(ImmExt), .imm_src(ImmSrc), .instr(instruction[31:7]));

    assign pc_target = pc_current + ImmExt;

    wire reg_read_addr_1 = instruction[19:15];
    wire reg_read_addr_2 = instruction[24:20];
    wire reg_write_addr = instruction[11:7];

    // operations on register file
    register_file reg_file(.clk(clk), .we3(we3),
                           .a1(reg_read_addr_1), .a2(reg_read_addr_2), 
                           .a3(reg_write_addr), .wd3(reg_write_data),
                           .rd1(reg_read_data_1), .rd2(reg_read_data_2));


    // ALU
    aluN alu (.y(ALUResult), .ALU_control(ALUControl), .a(reg_read_data_1),
              .b((AluSrc == 1'b0) ? reg_read_data_1 : ImmExt));

    // Data Memory
    data_memory data_mem (.clk(clk), .write_enable(MemWrite), .adr(ALUResult), .din(reg_read_data_2), .dout(ReadData));

    assign result = (ResultSrc == 1'b0) ? ALUResult : ReadData;
endmodule