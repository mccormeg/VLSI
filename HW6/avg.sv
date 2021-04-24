module avg(
	input clk,
	input reset_n,
	input [7:0] data_in,
	input r_avg,
	output [7:0] avg
);

logic [9:0] temp;

assign avg = temp >> 2;
always_ff @(posedge clk, negedge reset_n)
	begin
		if(~reset_n)
			temp <= 0;
		else if(r_avg)
			temp <= temp + data_in;
		else
			temp <= data_in;
		
	end
endmodule