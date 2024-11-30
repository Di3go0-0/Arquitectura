`include "./PC.sv"
`include "./SUM.sv"
`include "./IM.sv"
`include "./CU.sv"
`include "./RU.sv"
`include "./IMMG.sv"
`include "./MUXALUA.sv"
`include "./MUXALUB.sv"
`include "./BRU.sv"
`include "./ALU.sv"
`include "./MUXBU.sv"
`include "./MUXDM.sv"


module TLD(clk);
  input logic clk;
  
  //entradas y salidas para el program counter 
  logic [31:0] outPC;
  
  //entradas y salidas para el sumador
  logic [31:0] outSUM;
  
  //entradas y salidas para la memoria de instrucciones
  logic [31:0] inst;
  
  //entradas y salidas para la unidad de control
  reg ALUAsrc, ALUBsrc, DmWr, RUWr; 
  logic [4:0] BrOp; 
  logic [1:0] RUDataWrSrc; 
  logic [3:0] ALUOp; 
  logic [2:0] ImmSrc, DMCtrl;
  
  //entradas y salidas para la memoria de registros
  logic [31:0] ruRs1, ruRs2;
  
  //entradas y salidas para el generador de inmmediatos
  logic [31:0] immExt;
  
  //entradas y salidas para el MUXALUA
  logic [31:0] outMuxa;
  
  //entradas y salidas para el MUXALUB
  logic [31:0] outMuxb; 
  
  //entradas y salidas para la branch unit
  logic NextPCSrc;
  
  //entradas y salidas para la ALU
  logic [31:0] ALURES;
  
  //entradas y salidas para el MUX de la branch unit
  logic [31:0] outMuxbu;
  
  //entradas y salidas para la data memory
  logic [31:0] dataRD; 
  
  //Entradas y salidas para el MUX de la data memory
  wire [31:0] outMuxdm;
  
  
  //Instancias para todos los modulos  
  //Program counter
  PC U0	(.clk(clk),
         .nxtAddres(outMuxbu), 
         .outPC(outPC));
  
  //adder 4
  SUM U1 (.addrPC(outPC),
          .outSUM(outSUM));
  
  //Instruction Memory
  IM U2 (.addrIM(outPC), 
         .inst(inst));
  
  //Control Unit  
  CU U3	(.opCode(inst[6:0]), 
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
  
  //Register Unit 
  RU U4 (.clk(clk), 
         .ruWr(RUWr), 
         .rs1(inst[19:15]), 
         .rs2(inst[24:20]), 
         .rd(inst[11:7]),
         .dataWR_Ru(outMuxdm),
         .ruRs1(ruRs1),
         .ruRs2(ruRs2));
  
  //Immediate generator  
  IMMG U5 (.inst(inst[31:7]),
           .immSrc(ImmSrc),
           .immExt(immExt));
  
  //MUX input A ALU  
  MUXALUA U6 (.Apc(outPC),
              .Brs1(ruRs1),
              .MUXopa(ALUAsrc),
              .outMuxa(outMuxa));
  
  //MUX input B ALU  
  MUXALUB U7 (.Ars2(ruRs2),
              .Bimext(immExt),
              .MUXopb(ALUBsrc),
              .outMuxb(outMuxb));
  
  //Branch Unit
  BRU U8 (.Aru(ruRs2),
          .Bru(ruRs1),
          .BrOp(BrOp),
          .NextPCSrc(NextPCSrc));	  
    
  //ALU
  ALU U9 (.A(outMuxa),
          .B(outMuxb),
          .ALUOP(ALUOp),
          .ALURES(ALURES));
  
  //MUX Branch Unit
  MUXBU U10	(.Asum(outSUM),
             .Balures(ALURES),
             .MUXopbu(NextPCSrc),
             .outMuxbu(outMuxbu));
   
  //MUX Data Memory
  MUXDM U12	(.Aoutpc(outSUM),
             .Bdatard(dataRD),
             .Calures(ALURES),
             .MUXopRUW(RUDataWrSrc),
             .outMuxdm(outMuxdm));   
  
endmodule 
