module shift_reg(
	input shift_en,
	input clk_50,
	input reset_n,
	input data_in,
	output logic [7:0] data_out
);
	
	logic [7:0] temp; 
	always_ff @ (posedge clk_50, negedge reset_n)
		begin
			if(~reset_n)
				temp <= 0;
			else if(shift_en)
			begin
				temp <= (temp >> 1);
				temp[7] <= data_in;
			end
		end
	assign data_out = temp;
endmodule