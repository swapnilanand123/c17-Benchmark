# c17-Benchmark

INTRODUCTION #

This repository contains all the information studied and created during the Logic locking , RTL design using Verilog with SKY130 Technology workshop , OpenROAD flow from RTL-to-GDS using OpenROAD Flow Scripts and TCL Workshop: From Introduction to Advanced Scripting. It is foucused on a logic Enryption of gate netlist,  of basic VLSI design flow to use OpenROAD-flow-scripts for the complete RTL-to-GDS flow and TCL scripting 


Definition 
c17 is a combinational benchmark circuit that belongs to ISCAS85 family with five inputs (i.e., N1,N2,N3,N6 and N7) and two outputs (i.e., N22,N23) . All benchmark circuits of the ISCAS85 family are used for logic testing. C17 is chosen for evaluation as it is the smallest circuit amongst the ISCAS85 family. This benchmark circuit consists of six NAND gates.

Verilog Code:

module c17 (N1,N2,N3,N6,N7,N22,N23);

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

Schematic:

![image](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/650463a8-f8e0-4b12-8c6d-3c7064010d17)

Simulation: 
iverilog c17.v tb_c17.v

./a.out

gtkwave c17_tb.vcd


![image](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/30fa5430-61c7-46aa-aca5-9647a5f77b82)

Synthesis:

yosys

yosys> read_liberty -lib ../../sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys> read_verilog c17.v

yosys> synth -top c17

abc -liberty ../../sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

show

![image](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/737cdf46-defb-4c30-8f49-683f3f4bb6c4)




C17enc: 

Here, Using Logic Encryption in c17 benchmark circuit to encrypt the logic design. It only behave like original c17 benchmark circuit if we give exact key values here which is 111 in this case.

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

Schematic:

![image](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/e6bf92a4-924d-4493-9b63-6241b5d68bfd)


Waveform:
verilog c17enc.v tb_c17enc.v

./a.out

gtkwave c17_tb.vcd

![image](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/0041c7fa-6656-4813-889b-66c4e6c170a2)

Synthesis:
yosys

yosys> read_liberty -lib ../../sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys> read_verilog c17enc.v

yosys> synth -top c17enc

abc -liberty ../../sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

show


![image](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/ed877cef-3f42-4c2c-96f5-8bdaf8204261)

OPENROAD INSTALLATION PROCESS:
Videos to Follow: (https://theopenroadproject.org/videos/) 
Downaload : https://www.klayout.org/downloads/Ubuntu-22/klayout_0.28.11-1_amd64.deb
Run Cmd on Terminal : 
cp ~/Downloads/klayout_0.28.11-1_amd64.deb .
sudo apt install ./klayout_0.28.11-1_amd64.deb

https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2023-08-23/oss-cad-suite-linux-x64-20230823.tgz
Run Cmd on Terminal :
mv ~/Downloads/oss-cad-suite-linux-x64-20230823.tgz .
tar -xzvf oss-cad-suite-linux-x64-20230823.tgz  (for unzip the file)

https://github.com/Precision-Innovations/OpenROAD/releases/download/2023-08-22/openroad_2.0_amd64-ubuntu22.04-2023-08-22.deb
Run Cmd on Terminal:
mv ~/Downloads/openroad_2.0_amd64-ubuntu22.04-2023-08-22.deb .
sudo apt install ./openroad_2.0_amd64-ubuntu22.04-2023-08-22.deb
git clone https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git
export OPENROAD_EXE="/usr/bin/openroad"


RTL to GDSII flow: -
![image](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/8ef4d6be-2557-45b3-8991-a448f2c4adb7)

![image](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/5a315c38-0dae-448c-9f4a-80be7e93a6dc)

~/OPENROAD_FLOW/OpenROAD-flow-scripts/flow/designs/sky130hd/c17$ gedit config.mk 

![Screenshot from 2023-09-02 18-46-48](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/226c3c0b-55f6-4022-a18d-b1e802951884)

~/OPENROAD_FLOW/OpenROAD-flow-scripts/flow/designs/sky130hd/c17$ gedit constraint.sdc

![Screenshot from 2023-09-02 18-45-59](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/4723db02-e745-4efd-84df-5e6bfec515c3)


OPENROAD_FLOW$ source ORFS_bashrc
OPENROAD_FLOW/OpenROAD-flow-scripts/flow$ make DESIGN_CONFIG=./designs/sky130hd/s298/config.mk

![Screenshot from 2023-09-02 18-59-24](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/9d93276c-9ac3-467b-88f2-39a3d2a42e49)


OPENROAD_FLOW/OpenROAD-flow-scripts/flow$ make DESIGN_CONFIG=./designs/sky130hd/s298/config.mk gui_final
![Screenshot from 2023-09-02 19-01-12](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/937c03dc-efa4-4c35-94e6-52f3c2fa28c6)


OPENROAD_FLOW/OpenROAD-flow-scripts/flow$ klayout -s ./results/sky130hd/s298/base/6_final.gds -l ./platforms/sky130hd/sky130hd.lyp

![Screenshot from 2023-09-02 19-00-41](https://github.com/swapnilanand123/c17-Benchmark/assets/143795450/1ff9d953-f9d7-43bf-a987-de33e6c43154)






 


