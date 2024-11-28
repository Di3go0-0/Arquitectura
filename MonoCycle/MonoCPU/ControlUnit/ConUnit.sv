module CU(opCode, funct3, funct7, ALUAsrc, ALUBsrc, DmWr, DMCtrl, RUWr, BrOp, RUDataWrSrc, ALUOp, ImmSrc);
    
  input logic [6:0] opCode, funct7;  
  input logic [2:0] funct3;
    
  output logic ALUAsrc, ALUBsrc, RUWr;  
  output logic [4:0] BrOp;  
  output logic [1:0] RUDataWrSrc;  
  output logic [3:0] ALUOp;  
  output logic [2:0] ImmSrc;

    
  always @(*) begin      
    case (opCode)        
      //Type R instructions        
      7'b0110011:          
        begin            
          RUWr <= 1;            
          ALUOp <= {funct7[5], funct3};            
          ImmSrc <= 3'bxxx;            
          ALUAsrc <= 0;            
          ALUBsrc <= 0;                     
          BrOp <= 5'b00000;           
          RUDataWrSrc <= 2'b00;          
        end
        
        //Type I instructions
        // sirve para las instrucciones de carga y store
        7'b0010011:
          begin
            RUWr <= 1;
            ALUOp <= {funct7[5], funct3};
            ImmSrc <= 3'b000;
            ALUAsrc <= 0;
            ALUBsrc <= 1;
            BrOp <= 5'b00000;
            RUDataWrSrc <= 2'b00;        
          end          
        
        //Type B instructions
        7'b1100011:
          begin
            RUWr <= 0;
            ALUOp <= 4'b0000;
            ImmSrc <= 3'b101;
            ALUAsrc <= 0;
            ALUBsrc <= 1;
            BrOp <= {2'b01, funct3};
            RUDataWrSrc <= 2'b00;        
          end 
        
        //Type jal instructions Jump
        7'b1100111:
          begin
            RUWr <= 1;
            ALUOp <= 4'b0000;
            ImmSrc <= 3'b110;
            ALUAsrc <= 1;
            ALUBsrc <= 1;
            BrOp <= 5'b10000;
            RUDataWrSrc <= 2'b10;        
          end  

        // type AUIPC
        7'b0010111:
          begin
            RUWr <= 1;
            ALUOp <= 4'b0000;
            ImmSrc <= 3'b010;
            ALUAsrc <= 1;
            ALUBsrc <= 1;
            BrOp <= 5'b00000;
            RUDataWrSrc <= 2'b0 0;        
          end

        
      endcase
    end
endmodule