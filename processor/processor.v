`include "../instruction_memory/instruction_memory.v"
`include "../control_unit/main_decoder.v"
`include "../control_unit/alu_decoder.v"
`include "../extend/extend.v"
`include "../memory/register_file.v"
`include "../alu/alu32.v"
`include "../memory/data_memory.v"

/**
* This is the top-level block of the RISC-V partial implementation. 
*/
module processor(output pc_out, alu_result,
                 input clk, reset
                );

    reg [32-1:0] pc_current;
    wire [32-1:0] pc_next;
    wire [32-1:0] pc_plus_4;
    wire [32-1:0] pc_target;
    wire [31:0] instruction;
    wire [1:0] reg_dst, mem_to_reg, alu_op;
    wire [2:0] ALUControl;
    wire [31:0] alu_out;
    wire zero_flag;
    wire [31:0] result;


    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_current <= 32'd0;
        else 
            pc_current <= pc_next;

        $display($time, " PC = %d  alu_out = %d  pc_plus_4 = %d  pc_target = %d", pc_current, alu_out, pc_plus_4, pc_target);
        $display("Branch = %d  zero = %d  AluSrc = %d", Branch, zero_flag, AluSrc);
        $display("reg_read_data_1 = %d, reg_read_data_2 = %d, ImmExt = %d\n\n", reg_read_data_1, reg_read_data_2, ImmExt);
    end

    // program counter + 4
    assign pc_plus_4 = pc_current + 32'd4;


    // instruction memory
    /**
    * The instruction memory contains the instructions of the program that will run.
    */
    instruction_memory instr_mem(.pc(pc_current), .instr(instruction));


    wire [1:0] ALUOp;

    // control unit
    /**
    * The control unit aims to control the signals of the computer to achieve a result
    * based on the current instruction.
    */
    main_decoder main_dec(.opcode(instruction[6:0]), .reg_write(RegWrite), 
                          .imm_src(ImmSrc), .alu_src(AluSrc), 
                          .mem_write(MemWrite), .result_src(ResultSrc), 
                          .branch(Branch), .alu_op(ALUOp));

    alu_decoder alu_dec(.alu_control(ALUControl[2:0]),
                        .alu_op(ALUOp),
                        .funct3(instruction[14:12]),
                        .funct7(instruction[31:25]));


    // extend unit
    /**
    * The extend unit extends the signal of a number or add zeros to it.
    */

    wire [32-1:0] ImmExt;
    wire [2-1:0] ImmSrc;

    extend ext(.imm_ext(ImmExt), .imm_src(ImmSrc), .instr(instruction[31:7]));

    assign pc_target = pc_current + ImmExt;

    wire [5-1:0] reg_read_addr_1 = instruction[19:15];
    wire [5-1:0] reg_read_addr_2 = instruction[24:20];
    wire [5-1:0] reg_write_addr = instruction[11:7];
    wire [32-1:0] reg_read_data_1, reg_read_data_2, reg_write_data;
    wire [32-1:0] ALUResult;
    wire [32-1:0] ReadData;

    // operations on register file
    /**
    * The register file contains the registers of the processor;
    * it needs a clock, a write enable signal, the address from which
    * read data and where write data when enabled.
    */
    register_file reg_file(.clk(clk), .we(we),
                           .a1(reg_read_addr_1), .a2(reg_read_addr_2), 
                           .a3(reg_write_addr), .wd3(reg_write_data),
                           .rd1(reg_read_data_1), .rd2(reg_read_data_2));


    // ALU
    /**
    * The ALU is the part of the computer that do arithmetic and logic operations.
    */
    alu32 alu1 (.ALUResult(ALUResult), .zero_flag(zero_flag), .SrcA(reg_read_data_1),
               .SrcB((AluSrc == 1'b0) ? reg_read_data_2 : ImmExt), .ALUControl(ALUControl));

    // If there is a condition to branch, the next PC value must be to the 
    //instruction memory address appointed by the branching instruction.
    assign pc_next = (zero_flag && Branch) ? pc_target : pc_plus_4; 

    // Data Memory
    /**
    * This is the main memory of the computer.
    */
    data_memory data_mem (.clk(clk), .write_enable(MemWrite), 
                          .adr(ALUResult), .din(reg_read_data_2), .dout(ReadData));

    assign result = (ResultSrc == 1'b0) ? ALUResult : ReadData;

endmodule