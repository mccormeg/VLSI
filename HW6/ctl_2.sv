module ctl_2 (
	input clk,
	input reset_n,
	input empty,
	output logic r_avg,
	output logic rd_ptr,
	output logic wr_ram
);
//Read states
enum reg {
	dont_read = 1'b0,
	read = 1'b1,
	unknown_r	= 'x
} read_cs, read_ns;
//Byte counter states
enum reg [2:0] {
	zero = 3'b000,
	add1 = 3'b001,
	add2 = 3'b010,
	add3 = 3'b011,
	add4 = 3'b100,
	unknown_c = 'x
} counter_cs, counter_ns;
//Write to ram states
enum reg {
	dont_write = 1'b0, 
	write   = 1'b1,
	unknown_w = 'x
} write_cs,write_ns;

/*******************************************************
**	State Machines
*******************************************************/
always_ff @ (posedge clk, negedge reset_n)
	if(~reset_n)
		begin
			read_cs <= dont_read;
			counter_cs <= zero;
			write_cs <= dont_write;
		end
	else
		begin
			read_cs <= read_ns;
			counter_cs <= counter_ns;
			write_cs <= write_ns;
		end
//Combinational logic for the fifo read		
always_comb
	begin
		read_ns = unknown_r;
		rd_ptr = 0;
		case(read_cs)
			dont_read:
				if (empty == 0)
					read_ns = read;
				else
					read_ns = dont_read;
			read:
				begin
					rd_ptr = 1;
					read_ns = dont_read;
				end
		endcase
	end
//Combinational logic for the fifo read	
always_comb
	begin
		counter_ns = unknown_c;
		case(counter_cs)
			zero:
				if((empty==0) & (read_cs == read))
					counter_ns = add1;
				else
					counter_ns = zero;
			add1:
				if((empty==0) & (read_cs == read))
					counter_ns = add2;
				else
					counter_ns = add1;
			add2:
				if((empty==0) & (read_cs == read))
					counter_ns = add3;
				else
					counter_ns = add2;
			add3:
				if((empty==0) & (read_cs == read))
					counter_ns = add4;
				else
					counter_ns = add3;
			add4:	counter_ns = zero;
		endcase
	end	
//Write to ram
always_comb
	begin
		write_ns = unknown_w;
		wr_ram = 0;
		case(write_cs)
			dont_write:
				if((read_cs == read) & (counter_cs == add3))
					write_ns = write;
			write:	
				begin
					wr_ram = 1;
					write_ns = dont_write;
				end
		endcase
	end
always_comb
	if(counter_cs==add4)
		r_avg = 1;
	else
		r_avg = 0;
endmodule