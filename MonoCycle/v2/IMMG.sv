
module IMMG(inst, immSrc, immExt);
  input logic [31:7] inst;
  input logic [2:0] immSrc;
  
  output logic [31:0] immExt;
  
  always @(*) begin      
    case (immSrc)        
      3'b000: 
        //Type I
		immExt <= {{20{inst[31]}}, inst[31:20]};             
      3'b001: 
        //Type S        
		immExt <= {{20{inst[31]}}, inst[31:25], inst[11:7]};
      3'b101:          
        //Type B        
        immExt <= {{19{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};
      3'b010: 
        //Type U
        immExt <= {inst[31:12], {12{inst[31]}}};
      3'b110:      
        //Type J
      	immExt <= {{11{inst[31]}}, inst[31], inst[19:12], inst[20], inst[30:21], 1'b0}; 
      default: immExt = 32'b0;
    endcase  
  end
endmodule