	force a_in 10#14
	force b_in 10#9
	add wave -position insertpoint  \
	sim:/mult/a_in \
	sim:/mult/b_in \
	sim:/mult/clk \
	sim:/mult/reset \
	sim:/mult/start \
	sim:/mult/done \
	sim:/mult/product \
	sim:/mult/mult_reg
	force -freeze sim:/mult/clk 1 0, 0 {50 ns} -r 100ns
	force reset 0
	force start 0
	run 200
	run 50
	force reset 1
	run 100
	run 50
	force start 1
	run 100
	force start 0
	run 500
	run 8000
	add list -nodelta
	configure list -strobestart {99 ns} -strobeperiod {100 ns}
	configure list -usestrobe 1
	add list -notrigger -hex -width 32 -label clk clk
	add list -notrigger -hex -width 32 -label product product
	add list -notrigger -hex -width 32 -label done done
	write list mult.list
	quit