module ctl_50 (
	input clk,
	input reset_n,
	input data_ena,
	input a5_c3,
	output logic wr_ptr
);
//Assembled or not register
logic data_done;

//Write state machine states
enum reg {
	write = 1'b1,
	dont_write = 1'b0,
	unknown_w = 'x
}write_cs, write_ns;
//Counter states
enum reg [2:0]{
	header = 3'b000,
	data1 = 3'b001,
	data2 = 3'b010,
	data3 = 3'b011,
	data4 = 3'b100,
	unknown_c = 'x
}counter_cs, counter_ns;
//States for a valid byte
enum reg{
	allow = 1'b1,
	dont_allow = 1'b0,
	unknown_a = 'x
}allow_cs, allow_ns;
//Packet state machine states
enum reg{
	temp = 1'b1,
	not_temp = 1'b0,
	unknown_p = 'x
}packet_cs, packet_ns;
//Data created
//assign data_done = ((!data_ena) & (allow_cs));
/****************************************************
**	State machines
****************************************************/
//Sequencial to change states
always_ff @ (posedge clk, negedge reset_n)
	if(~reset_n)
		begin
			allow_cs <= dont_allow;
			packet_cs <= not_temp;
			counter_cs <= header;
			write_cs <= dont_write;
			
		end
	else
		begin
			allow_cs <= allow_ns;
			packet_cs <= packet_ns;
			counter_cs <= counter_ns;
			write_cs <= write_ns;
		end
//Control for valid bytes
always_comb
	begin
		allow_ns = unknown_a;
		if(data_ena)
			allow_ns = allow;
		else
			allow_ns = dont_allow;
	end
//Control for packets
always_comb
	begin
		packet_ns = unknown_p;
		case(packet_cs)
			temp:
				if(packet_cs != header)
					packet_ns = temp;
				else
					packet_ns = not_temp;
			not_temp:
				if((packet_cs == header) & a5_c3)
					packet_ns = temp;
				else
					packet_ns = not_temp;
		endcase
	end
//Control for counter
always_comb
	begin
		counter_ns = unknown_c;
		case(counter_cs)
			header:
				if((allow_cs))
					counter_ns = data1;
				else
					counter_ns = header;
			data1:
				if((!data_ena) && (allow_cs))
					counter_ns = data2;
				else
					counter_ns = data1;
			data2:
				if((!data_ena) && (allow_cs))
					counter_ns = data3;
				else
					counter_ns = data2;
			data3:
				if((!data_ena) && (allow_cs))
					counter_ns = data4;
				else
					counter_ns = data3;
			data4:
				if((!data_ena) && (allow_cs))
					counter_ns = header;
				else
					counter_ns = data4;
		endcase
	end	
//Control for write
always_comb
	begin
		write_ns = unknown_w;
		wr_ptr = 0;
		case(write_cs)
			dont_write:
				if(((counter_cs != header) & (allow_cs)) & (packet_cs == temp))
					write_ns = write;
				else
					write_ns = dont_write;
			write:
				begin
					wr_ptr = 1;
					write_ns = dont_write;
				end
		endcase
	end	
endmodule	