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

    // Instruction Memory 
    logic [31:0] instruction;  

    // Instruction_Memory