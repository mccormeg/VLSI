/************************************************************
** Name: Megan McCormick
** Program mult.sv
** Class: ECE 474 VLSI System Deisgn
** Date: 4/27/18
** Explination: Top module for a 32 bit multiplier
*************************************************************/
module mult( 
  input  reset,
  input  clk,
  input  [31:0] a_in,
  input  [31:0] b_in,
  input  start,
  output logic [63:0] product,
  output logic done);
  
  logic [31:0] mult_reg;
  logic [31:0] prod_reg_hi;
  logic [31:0] prod_reg_lo;
  
  logic [1:0] state;
  
  //Piece together product
	  //Asynchronous reset will reset if pressed
  //Will create top register (mult_reg)
  always_ff @(posedge clk, negedge reset)
	begin
		if(~reset)
			product <= 0;
		else	
			product <= {prod_reg_hi[31:0], prod_reg_lo[31:0]};
	end
	
  //Asynchronous reset will reset if pressed
  //Will create top register (mult_reg)
  always_ff @(posedge clk, negedge reset)
	begin
		if(~reset)
			mult_reg <= 0;
		else	
			mult_reg <=a_in;
	end

//Do work on prod_reg_hi (shift,add,reset...)
//Asynchronous reset
  always_ff @ (posedge clk, negedge reset)
	begin
		if(~reset)
			prod_reg_hi <= 0;
		else if (start)
			prod_reg_hi <= 0;
		else if (state == 2'b11)//If state is add, execute addition
			prod_reg_hi <= prod_reg_hi + mult_reg;
		else if(state == 2'b10)//If state is shift, execute shifting
			prod_reg_hi <= {1'b0, prod_reg_hi[31:1]};
		else
			prod_reg_hi <= prod_reg_hi;
	end
	
//Do work on prod_reg_lo (Shift, add, reset...)
// Asynchronous reset
	always_ff @(posedge clk, negedge reset)
		begin
			if(~reset)
				prod_reg_lo <= 0;
			else if(start)
				prod_reg_lo <= b_in;
			else if(state == 2'b10)//If state is shift, execute shifting
				prod_reg_lo <= {prod_reg_hi[0],prod_reg_lo[31:1]};
			else
				prod_reg_lo <= prod_reg_lo;
		end

//Instantiate mult_ctl
mult_ctl mul(
	.mul_bit_0(prod_reg_lo[0]),
	.start(start),
	.clk(clk),
	.done(done),
	.current_state(state)
);


endmodule
	
  