add wave -position insertpoint sim:/clock/*
force -freeze sim:/clock/clk_1sec 1 0, 0 {50 ns} -r 100
force -freeze sim:/clock/clk_1ms 1 0, 0 {5 ns} -r 10
force -freeze sim:/clock/reset_n 1'h0 0
run 200
force -freeze sim:/clock/reset_n 1'h1 0
run 2000000000000
