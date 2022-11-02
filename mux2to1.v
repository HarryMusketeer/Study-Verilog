//Name: HHH
//Date 05.07.22

/**************************************************************
*	Define the test bench module.
**************************************************************/
module testBench ;
  wire    f,s,w0,w1;
  mux2to1 myMux(w0,w1,f,s);
  TestModule myTester(w0,w1,f,s);
endmodule
  
/**************************************************************
*	Define the mux module.
**************************************************************/

module mux2to1(w0,w1,s,f);
  input w0,w1,s;
  output f;
  
  assign f= s ? w1:w0;

endmodule

/**************************************************************
*	Define the tester module.
**************************************************************/
module TestModule (w0,w1,s,f);
  input         f;
  output        w0,w1,s;
  integer       i;
  reg           w0,w1,s;
  
  initial
    begin
      w0=0;
      w1=0;
      s=0;
  end
  
  initial
    begin
      $display("Clock              Inputs          Output        Time");
      $display("--w0--       --w1--     --s--       --f--         --t--");
      $monitor("  %b           %b         %b          %d            ",w0,w1,s,f,$time);
      
      
      repeat(2)
        begin
          for (i=0; i<8;i=i+1)
            begin
             #10 {w0,w1,s}=i;
            end
        end
        
      
      #(100);
      
      $stop;
end
endmodule  
          
      
