# Define the module name and ports
set module_name "c17"
set ports {
    {input N1}
    {input N2}
    {input N3}
    {input N6}
    {input N7}
    {input keyinput24}
    {input keyinput25}
    {input keyinput26}
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
puts "nand NAND2_1 ($N10, N1, N3);"
puts "nand NAND2_2 ($N11, keyinput24, N3, N6);"
puts "nand NAND2_3 ($N16, keyinput26, N2, N11);"
puts "nand NAND2_4 ($N19, keyinput25, N11, N7);"
puts "nand NAND2_5 ($N22, N10, N16);"
puts "nand NAND2_6 ($N23, N16, N19);"

# Close the module
puts "endmodule"
