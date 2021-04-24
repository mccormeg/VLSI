/************************************************************
** Name: Megan McCormick
** Program fifo.sv
** Class: ECE 474 VLSI System Deisgn
** Date: 5/10/2018
** Explination: FIFO based memory for homework 4 of VLSI
** Will take in and print out data acordingly.
*************************************************************/
module fifo ( 
       input            wr_clk,   //write clock
       input            rd_clk,   //read clock
       input            reset_n,  //reset async active low
       input            wr,       //write enable 
       input            rd,       //read enable    
       input      [7:0] data_in,  //data in
       output reg [7:0] data_out, //data out
       output           empty,    //empty flag
       output           full      //full flag
	   );
	//Internal wires/registers
	logic rd_toggle;
	logic wr_toggle;
	logic [2:0] rd_ptr;
	logic [2:0] wr_ptr;
	logic [7:0] mem [7:0];
	logic sfull;
	logic sempty;
	//Read data
	always_ff @ (posedge wr_clk, negedge reset_n)
		begin
			if (~reset_n)
				data_out <= 0;
			else if (wr)
				mem[wr_ptr] <= data_in;		
		end
	//Write data
	always_ff @ (posedge rd_clk, negedge reset_n)
		begin
			if(~reset_n)
				mem[0] <= 0;
			else if (rd)
				data_out <= mem[rd_ptr];
		end
	//Increase write pointer
	always_ff @ (posedge wr_clk, negedge reset_n)
		begin
			if (~reset_n)
				wr_ptr <= 0;
			else if (wr)
				begin
					if (wr_ptr == 7)
						wr_toggle = ~wr_toggle;
					wr_ptr <= wr_ptr + 1;
				end				
			else
				wr_ptr <= wr_ptr;
		end
	//Increase read pointer
	always_ff @ (posedge rd_clk, negedge reset_n)
		begin
			if(~reset_n)
				rd_ptr <= 0;
			else if (rd)
				begin
					if(rd_ptr == 7)
						rd_toggle = ~rd_toggle;
					rd_ptr <= rd_ptr + 1;
				end
			else 
				rd_ptr <= rd_ptr;
		end	
	//Set Full
	always_ff @ (posedge wr_clk, negedge reset_n)
		begin
			if (~reset_n)
				begin
					sfull <= 0;
					wr_toggle <= 0;
				end
			else if ((rd_toggle != wr_toggle) && (wr_ptr == 1))
				sfull <= 1;
			else
				sfull <= 0;
		end
	//Set Empty
	always_ff @ (posedge rd_clk, negedge reset_n)
		begin
			if (~reset_n)
				begin
					sempty <= 1;
					rd_toggle <= 0 ;
				end
			else if ((rd_toggle == wr_toggle) && (rd_ptr == 0))
				sempty <= 1;
			else
				sempty <= 0;
		end	
	//Assign full and empty
	
	assign full = sfull;
	assign empty = sempty;
endmodule