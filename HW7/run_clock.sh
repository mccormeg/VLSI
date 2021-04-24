#!/bin/bash
if [ ! -d "work" ]; then 
	echo "Missing work file"
	echo "Creating file now..."
	vlib work
fi
echo "Compiling program..."
	vlog decoder.sv mux.sv parser.sv clock.sv select_sm.sv
if [ -s "clock_list.do" ]; then
		echo "Running simulation for military clock..."
		vsim -novopt clock -do clock_list.do -quiet -c +nowarnTFMPC +nowarnTSCALE
else
	echo "File doesn't exist"
fi
if [ -s "clock_list_reg.do" ]; then
		echo "Running simulation for standard clock..."
		vsim -novopt clock -do clock_list_reg.do -quiet -c +nowarnTFMPC +nowarnTSCALE
else
	echo "File doesn't exist"
fi
