module tb_cpm();
  logic clk;
  
  TLD U0(
    .clk(clk)
  );
  
  always begin 
    #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
	clk = 0;
	#50;
    $finish; 
  end
endmodule 

