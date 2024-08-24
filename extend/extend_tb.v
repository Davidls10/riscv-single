`include "extend.v"

module extend_tb;
    reg [1:0] ImmSrc;
    reg [31:7] instr;
    wire [31:0] ImmExt;
    extend uut (.imm_src(ImmSrc), .instr(instr), .imm_ext(ImmExt));

    initial begin
        $dumpfile("extend.vcd");
        $dumpvars(0, extend_tb);

        ImmSrc = 2'b00;
        
    end

endmodule