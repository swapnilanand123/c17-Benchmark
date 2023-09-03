# Define the testbench module
set tb_module_name "c17_tb"

# Create the testbench module
puts "module $tb_module_name();"
puts "\treg N1, N2, N3, N6, N7;"
puts "\twire N22, N23;"

# Instantiate the design module
puts "\tc17 TB ("
puts "\t\t.N1(N1),"
puts "\t\t.N2(N2),"
puts "\t\t.N3(N3),"
puts "\t\t.N6(N6),"
puts "\t\t.N7(N7),"
puts "\t\t.N22(N22),"
puts "\t\t.N23(N23)"
puts "\t);"

# Initialize signals and add delays
puts "\tinitial begin"
puts "\t\t$dumpfile(\"c17_tb.vcd\");"
puts "\t\t$dumpvars(1, TB);"

# Create the test cases
for {set i 0} {$i < 16} {incr i} {
    set N1_val [expr {$i / 8}]
    set N2_val [expr {($i / 4) % 2}]
    set N3_val [expr {($i / 2) % 2}]
    set N6_val [expr {($i % 2)}]
    set N7_val [expr {($i / 8)}]

    puts "\t\t#2 N1=$N1_val; N2=$N2_val; N3=$N3_val; N6=$N6_val; N7=$N7_val;"
}

# Finish the simulation
puts "\t\t#100 $finish;"
puts "\tend"
puts "endmodule"
