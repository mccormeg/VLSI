	add wave -position insertpoint  \
	sim:/mult_ctl/clk \
	sim:/mult_ctl/start \
	sim:/mult_ctl/done \
	sim:/mult_ctl/count \
	sim:/mult_ctl/current_state
	force -freeze sim:/mult_ctl/clk 1 0, 0 {50 ns} -r 100
	force start 0
	run 200
	run 50
	force start 1
	run 100
	force start 0
	run 500
	run 8000