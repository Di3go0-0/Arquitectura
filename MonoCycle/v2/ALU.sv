module ALU(A, B, shampt, ALUOP, ALURES);
  input logic [31:0] A, B;
  input logic [4:0] shampt; 
  input logic [3:0] ALUOP;
  
  output logic [31:0] ALURES;
  
  initial begin
    assign shampt = B[4:0];
  end

  always @(*)
    begin
      /*$display("En ALU --> A = %d", A);
      $display("En ALU --> B = %d", B);
      $display("En ALU --> ALUOP = %d", ALUOP);*/
      case(ALUOP)
        4'b0000:
          begin
            ALURES <= A + B;
          end
        
        4'b1000:
          begin
            $display("En ALU --> A = %d", A);
      $display("En ALU --> B = %d", B);
      $display("En ALU --> ALUOP = %d", ALUOP);
            ALURES <= A - B;
          end
        
        4'b0001:
          begin
            ALURES <= A << shampt;
          end
        
        4'b0010:
          begin
            ALURES <= A < B;
          end
        
        4'b0011:
          begin
            ALURES <= A < $unsigned(B);
          end  
        
        4'b0100:
          begin
            ALURES <= A ^ B;
          end
        
        4'b0101:
          begin
            ALURES <= A >> shampt;
          end
        
        4'b1101:
          begin
            ALURES <= A >>> shampt;
          end  
        
        4'b0110:
          begin
            ALURES <= A | B;
          end        
        
        4'b0111:
          begin
            ALURES <= A & B;
          end
      endcase
      //$display("En ALU --> ALURES = %d", ALURES);
    end
endmodule