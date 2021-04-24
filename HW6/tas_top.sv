module tas (
       input  clk_50,               // 50Mhz input clock
       input  clk_2,                // 2Mhz input clock
       input  reset_n,              // reset async active low
       input  serial_data,          // serial input data
       input  data_ena,             // serial data enable
       output ram_wr_n,             // write strobe to ram
       output [7:0] ram_data,       // ram data
       output [10:0] ram_addr       // ram address
       );
	   
	//Wires used
	wire [7:0] serial_out;
	wire wr_ptr;
	wire empty;
	wire rd_ptr;
	wire wr_ram;
	wire [7:0] fifo_out;
	wire r_avg;
	//registers
	reg a5_c3;
	
	//Assign statements
	//Check if A5 or C3 was sent 
	assign a5_c3 = (serial_out == 8'hA5) || (serial_out == 8'hC3);
	//Instantiate Shift Register
	shift_reg shift(
		.shift_en(data_ena),
		.clk_50(clk_50),
		.reset_n(reset_n),
		.data_in(serial_data),
		.data_out(serial_out)
	);
	ctl_50 my_clk_50(
		.clk(clk_50),
		.reset_n(reset_n),
		.data_ena(data_ena),
		.a5_c3(a5_c3),
		.wr_ptr(wr_ptr)
	);
	ctl_2 my_clk_2(
		.clk(clk_2),
		.reset_n(reset_n),
		.empty(empty),
		.r_avg(r_avg),
		.rd_ptr(rd_ptr),
		.wr_ram(ram_wr_n)
	);
	fifo my_fifo( 
       .wr_clk(clk_50),   //write clock
       .rd_clk(clk_2),   //read clock
       .reset_n(reset_n),  //reset async active low
       .wr(wr_ptr),       //write enable 
       .rd(rd_ptr),       //read enable    
       .data_in(serial_out),  //data in
       .data_out(fifo_out), //data out
       .empty(empty),    //empty flag
       .full()      //full flag
	);
	ram my_ram(
		.clk(clk_2),
		.reset_n(reset_n),
		.wr_ram(ram_wr_n),
		.ram_add(ram_addr)
	);
	avg my_avg(
		.clk(clk_2),
		.reset_n(reset_n),
		.data_in(fifo_out),
		.r_avg(r_avg),
		.avg(ram_data)
	);
endmodule	