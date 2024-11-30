module IM(addrIM, inst);
  input logic [31:0] addrIM;
  output logic [31:0] inst;
  
  logic [7:0] im [0:1023];
  
  initial begin  
    $readmemb("program.txt", im);  
    
  end
  
  always @(*) begin
    inst <= {im[addrIM], im[addrIM + 1], im[addrIM + 2], im[addrIM + 3]};
  end
endmodule