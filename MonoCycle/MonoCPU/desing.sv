`include "./ALU/ALU.sv"
`include "./BranchUnit/BranchUnit.sv"
`include "./ControlUnit/ControlUnit.sv"
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
    // Prpgram counter
    logic [31:0] PC;

    // sumador
    logic [31:0] sum; 

    // Instruction_Memory
    logic [31:0] Instruction_Memory;
    
    // Input output to controlUnit
    reg ALUAsrc, ALUBsrc, DmWr, RUWr; 
    logic [4:0] BrOp;
    logic[1:0] RUDataWrSrc; 
    logic [3:0] ALUOp; 
    logic [2:0] ImmSrc, DMCtrl; 

    // RegisterUnit 
    logic [31:0] RURs1, RURs2;
    
    // Imm-Generator
    logic [31:0] ImmExt;
    
    // MUX ALUA
    logic [31:0] outMuxa;
    
    // MUX ALUB
    logic [31:0] outMuxb;
    
    // Input output to BranchUnit
    logic NextPCSrc;

    // ALU
    logic [31:0] S;
    
    // Branch Unit
    logic [31:0] outMuxbu;

    //Entradas y salidas para el MUX de la data memory
    wire [31:0] outMuxdm;

    //Instancias
    //ProgramCount
    PC U0 (.clk(clk),
            .nxtAddres(outMuxbu),
            .outPC(outPC));
            
    //Sumador
    SUM U1 (.addrPC(outPC),
            .outSUM(outSUM));
    
    //Instruction Memory
    Instruction_Memory U2(.addrIM(outPC),
                          .inst(inst));

    //ControlUnit
    CU U3(.opCode(inst[6:0]),
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
    
    //Register unit
    RegisterUnit U4(.clk(clk),
                    .rs1(inst[19:15]),
                    .rs2(inst[24:20]),
                    .rd(inst[11:7]),
                    .DataWr(outMuxdm),
                    .RUWr(RUWr),
                    .RURs1(RURs1),
                    .RURs2(RURs2));
    
    //Imm-Generator
    imm_gen U5(.imm(inst[31:7]),
                .ImmSrc(ImmSrc),
                .ImmExt(ImmExt)); 

    //MUX input A ALU
    MuxAluA U6(.ALUAsrc(ALUAsrc),
                .RURs1(RURs1),
                .ImmExt(ImmExt),
                .outMuxa(outMuxa));

    //MUX input B ALU
    MuxAluB U7(.ALUBsrc(ALUBsrc),
                .RURs2(RURs2),
                .ImmExt(ImmExt),
                .outMuxb(outMuxb));

    //branch unit
    BRU U8(.RS1(RURs1),
            .RS2(RURs2),
            .BrOp(BrOp),
            .NextPCSrc(NextPCSrc));
    
    // ALU
    ALU U9(.A(outMuxa),
           .B(outMuxb),
           .ALUOp(ALUOp),
           .S(S));
    
    //MUX brach unit
    MUXPC U10(.Asum(outSUM),
              .Balures(S),
              .MUXopbu(NextPCSrc),
              .outMuxbu(outMuxbu));
    
    //MUX data memory
    MUXRUD U11(.Aoutpc(outSUM),
               .Bdatard(S),
               .Calures(S),
               .MUXopRUW(RUDataWrSrc),
               .outMuxdm(outMuxdm));





