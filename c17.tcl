# Define the module name and ports
set module_name "c17"
set ports {
    {input N1}
    {input N2}
    {input N3}
    {input N6}
    {input N7}
    {output N22}
    {output N23}
}
set wires {
    {wire N10}
    {wire N11}
    {wire N16}
    {wire N19}
}

# Create the Verilog module header
puts "module $module_name ("
foreach port $ports {
    set direction [lindex $port 0]
    set name [lindex $port 1]
    puts "\t$direction $name,"
}
puts ");"

# Instantiate NAND gates
puts ""
puts "// NAND gates"
foreach gate {NAND2_1 NAND2_2 NAND2_3 NAND2_4 NAND2_5 NAND2_6} {
    set inputs [split $gate "_"]
    set output [lindex $inputs 0]
    set input1 [lindex $inputs 1]
    set input2 [lindex $inputs 2]
    puts "nand $gate ($output, $input1, $input2);"
}

# Close the module
puts "endmodule"
