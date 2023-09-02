// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module c17enc_tb();
  reg  N1,N2,N3,N6,N7;
  reg keyinput26=1'b1, keyinput24=1'b1 ,keyinput25=1'b1;
  wire N22,N23;

  c17 TB (N1,N2,N3,N6,N7,N22,N23,keyinput24,keyinput25,keyinput26);
  
  
  initial begin
   
    $dumpfile("c17_tb.vcd");
    $dumpvars(1, TB);
  
        N1=0;N2=0;N3=0;N6=0;N7=0;
    #2 N1=0;N2=0;N3=0;N6=0;N7=0;
    #2 N1=0;N2=0;N3=0;N6=0;N7=1;
    #2 N1=0;N2=0;N3=0;N6=1;N7=0;
    #2 N1=0;N2=0;N3=0;N6=1;N7=1;
    #2 N1=0;N2=0;N3=1;N6=0;N7=0;
    #2 N1=0;N2=0;N3=1;N6=0;N7=1;
    #2 N1=0;N2=0;N3=1;N6=1;N7=0;
    #2 N1=0;N2=0;N3=1;N6=1;N7=1;
    #2 N1=0;N2=1;N3=0;N6=0;N7=1;
    #2 N1=0;N2=1;N3=0;N6=1;N7=0;
    #2 N1=0;N2=1;N3=0;N6=1;N7=1;
    #2 N1=0;N2=1;N3=1;N6=0;N7=0;
    #2 N1=0;N2=1;N3=1;N6=0;N7=1;
    #2 N1=0;N2=1;N3=1;N6=1;N7=0;
    #2 N1=0;N2=1;N3=1;N6=1;N7=1;
    
    #2 N1=1;N2=0;N3=0;N6=0;N7=0;
    #2 N1=1;N2=0;N3=0;N6=0;N7=1;
    #2 N1=1;N2=0;N3=0;N6=1;N7=0;
    #2 N1=1;N2=0;N3=0;N6=1;N7=1;
    #2 N1=1;N2=0;N3=1;N6=0;N7=0;
    #2 N1=1;N2=0;N3=1;N6=0;N7=1;
    #2 N1=1;N2=0;N3=1;N6=1;N7=0;
    #2 N1=1;N2=0;N3=1;N6=1;N7=1;
    #2 N1=1;N2=1;N3=0;N6=0;N7=1;
    #2 N1=1;N2=1;N3=0;N6=1;N7=0;
    #2 N1=1;N2=1;N3=0;N6=1;N7=1;
    #2 N1=1;N2=1;N3=1;N6=0;N7=0;
    #2 N1=1;N2=1;N3=1;N6=0;N7=1;
    #2 N1=1;N2=1;N3=1;N6=1;N7=0;
    #2 N1=1;N2=1;N3=1;N6=1;N7=1;
    #100 $finish;    
  end	
endmodule
