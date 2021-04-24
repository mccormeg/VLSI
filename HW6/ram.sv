module ram(
	input clk,
	input reset_n,
	input wr_ram,
	output logic [10:0] ram_add
);

always_ff @ (posedge clk, negedge reset_n)
	begin
		if(~reset_n)
			ram_add <= 11'h7FF;
		else if((ram_add == 0) & wr_ram)
			ram_add <= 11'h7FF;
		else if(wr_ram)
			ram_add <= ram_add - 1;
	end
endmodule