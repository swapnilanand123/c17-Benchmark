# c17-Benchmark

INTRODUCTION #

This repository contains all the information studied and created during the Logic locking , Advanced Physical Design Using OpenLANE / SKY130 workshop. It is primarily foucused on a complete RTL2GDSII flow using the open-soucre flow named OpenLANE. PICORV32A RISC-V core design is used for the purpose as the RTL design source.

c17 benchmark Verilog Code with Logic Encryption, RTL Synthesis, RTL to GDSII Analysis, TCL Scripting 



C17 is a combinational benchmark circuit that belongs to ISCAS85 family with five inputs (i.e., N1,N2,N3,N6 and N7) and two outputs (i.e., N22,N23) . All benchmark circuits of the ISCAS85 family are used for logic testing. C17 is chosen for evaluation as it is the smallest circuit amongst the ISCAS85 family. This benchmark circuit consists of six NAND gates.

Verilog Code: module c17 (N1,N2,N3,N6,N7,N22,N23);

input N1,N2,N3,N6,N7;

output N22,N23;

wire N10,N11,N16,N19;

nand NAND2_1 (N10, N1, N3);
nand NAND2_2 (N11, N3, N6);
nand NAND2_3 (N16, N2, N11);
nand NAND2_4 (N19, N11, N7);
nand NAND2_5 (N22, N10, N16);
nand NAND2_6 (N23, N16, N19);

endmodule


Testbench: 
// Code your testbench here
// or browse Examples
module c17_tb();
  reg  N1,N2,N3,N6,N7;
  wire N22,N23;

  c17 TB (N1,N2,N3,N6,N7,N22,N23);
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



C17enc: 
Here, Using Logic Encryption in c17 benchmark circuit to encrypt the logic design. It only behave like original c17 benchmark circuit if we give exact key values here which is 111 in this case  
Verilog Code: 
module c17 (N1,N2,N3,N6,N7,N22,N23,keyinput24,keyinput25,keyinput26);

input N1,N2,N3,N6,N7;
  input keyinput24,keyinput25,keyinput26;

output N22,N23;  

wire N10,N11,N16,N19;

nand NAND2_1 (N10, N1, N3);
nand NAND2_2 (N11, keyinput24,N3, N6);
  nand NAND2_3 (N16,keyinput26, N2, N11);
  nand NAND2_4 (N19, keyinput25,N11, N7);
nand NAND2_5 (N22, N10, N16);
nand NAND2_6 (N23, N16, N19);

endmodule

Testbench:
module c17_tb();
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
Schematic

Waveform




Synthesis
