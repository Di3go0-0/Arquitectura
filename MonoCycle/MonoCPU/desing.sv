`include "./ALU/ALU.sv"
`include "./BranchUnit/BranchUnit.sv"
`include "./ControlUnit/ConUnit.sv"
`include "./IMM-Generator/Imm-Generator.sv"
`include "./InstructionMemory/InnMemo.sv"
`include "./MUX2-1/MuxALuA/MuxAluA.sv"
`include "./MUX2-1/MuxAluB/MuxAluB.sv"
`include "./MUX2-1/MuxNextPC/MuxNextPc.sv"
`include "./MUX3-1/MuxRUD/MuxRUD.sv"
`include "./ProgramCounter/ProgramCount.sv"
`include "./RegisterUnit/RegisterUnit.sv"
`include "./Sumador/Sum.sv"

module TLD(clk);
    input logic clk;

    // Program counter
    wire [31:0] outPC;

    // Sumador
    wire [31:0] outSUM;

    // Instruction Memory
    wire [31:0] inst;

    // Señales de control
    wire ALUAsrc, ALUBsrc, DmWr, RUWr;
    wire [4:0] BrOp;
    wire [1:0] RUDataWrSrc;
    wire [3:0] ALUOp;
    wire [2:0] ImmSrc, DMCtrl;

    // RegisterUnit
    wire [31:0] RURs1, RURs2;

    // Imm-Generator
    wire [31:0] ImmExt;

    // MUX ALUA
    wire [31:0] outMuxa;

    // MUX ALUB
    wire [31:0] outMuxb;

    // Branch Unit
    wire NextPCSrc;

    // ALU
    wire [31:0] S;

    // MUX Branch Unit
    wire [31:0] outMuxbu;

    // MUX Data Memory
    wire [31:0] outMuxdm;

    // Instancias
    // Program Counter
    PC U0 (.clk(clk),
           .nxtAddres(outMuxbu),
           .outPC(outPC));

    // Sumador
    SUM U1 (.addrPC(outPC),
            .outSUM(outSUM));

    // Instruction Memory
    Instruction_Memory U2 (.addrIM(outPC),
                           .inst(inst));

    // Control Unit
    CU U3 (.opCode(inst[6:0]),
           .funct3(inst[14:12]),
           .funct7(inst[31:25]),
           .ALUAsrc(ALUAsrc),
           .ALUBsrc(ALUBsrc),
           .DmWr(DmWr),
           .DMCtrl(DMCtrl),
           .RUWr(RUWr),
           .BrOp(BrOp),
           .RUDataWrSrc(RUDataWrSrc),
           .ALUOp(ALUOp),
           .ImmSrc(ImmSrc));

    // Register Unit
    RegisterUnit U4 (.clk(clk),
                     .rs1(inst[19:15]),
                     .rs2(inst[24:20]),
                     .rd(inst[11:7]),
                     .DataWr(outMuxdm),
                     .RUWr(RUWr),
                     .RURs1(RURs1),
                     .RURs2(RURs2));

    // Imm-Generator
    imm_gen U5 (.imm(inst[31:7]),
                .ImmSrc(ImmSrc),
                .ImmExt(ImmExt));

    // MUX input A ALU
    MuxAluA U6 (.Apc(outSUM),
                .Brs1(RURs1),
                .MUXopa(ALUAsrc),
                .outMuxa(outMuxa));

    // MUX input B ALU
    MuxAluB U7 (.Ars2(RURs2),
                .Bimext(ImmExt),
                .MUXopb(ALUBsrc),
                .outMuxb(outMuxb));

    // Branch Unit
    BRU U8 (.RS1(RURs1),
            .RS2(RURs2),
            .BrOp(BrOp),
            .NextPCSrc(NextPCSrc));

    // ALU
    ALU U9 (.A(outMuxa),
            .B(outMuxb),
            .AluOp(ALUOp),
            .S(S));

    // MUX Branch Unit
    MUXPC U10 (.Asum(outSUM),
               .Balures(S),
               .MUXopbu(NextPCSrc),
               .outMuxbu(outMuxbu));

    // MUX Data Memory
    MUXRUD U11 (.Aoutpc(outSUM),
                .Bdatard(S),
                .Calures(S),
                .MUXopRUW(RUDataWrSrc),
                .outMuxdm(outMuxdm));
endmodule

