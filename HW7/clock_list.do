add list -nodelta -unsigned -width 20 -label sec_cout \
sim:/clock/sec_count 
add list -nodelta -unsigned -width 20 -label min_cout \
sim:/clock/min_count 
add list -nodelta -unsigned -width 20 -label hour_cout \
sim:/clock/hour_count
force -freeze sim:/clock/clk_1sec 1 0, 0 {50 ns} -r 100
force -freeze sim:/clock/clk_1ms 1 0, 0 {5 ns} -r 10
force -freeze sim:/clock/reset_n 1'h0 0
run 200
force -freeze sim:/clock/reset_n 1'h1 0
force -freeze sim:/clock/mil_time 1'h1 0
run 233281300
write list clock_mil.list
quit