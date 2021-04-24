/************************************************************
** Name: Megan McCormick
** Program gcd.sv
** Class: ECE 474 VLSI System Deisgn
** Date: 5/18/18
** Explination: Top moduke for teh greatest common div
** Used skeleton code from Roger Traylor
*************************************************************/
module gcd( input [31:0] a_in,          //operand a
            input [31:0] b_in,          //operand b
            input start,                //validates the input data
            input reset_n,              //reset
            input clk,                  //clock
            output reg [31:0] result,  //output of GCD engine
            output reg done);          //validates output value
//declare the internal 32-bit register busses

logic [31:0] reg_a;
logic [31:0] reg_b;
logic a_lt_b;
logic b_neq_zero;

//declare the enumerated values for register a mux select
  enum reg [1:0]{
	ALOAD_A = 2'b00,
	ASUB_B =  2'b01,
	ALOAD_B = 2'b10,
	AHOLD =   2'b11
  }mux_a;

//delcare the enumerated values for register b mux select
  enum reg [1:0]{
	BLOAD_B = 2'b00,
	BLOAD_A = 2'b01,
	BHOLD =   2'b10
	} mux_b;
	
  

//create reg_a and its mux
always_ff @(posedge clk, negedge reset_n) 
begin
  if (!reset_n)
	begin
		reg_a <= 0;
	end
	else
		begin	
			case (mux_a)
				ALOAD_A: 
					reg_a <= a_in;
				ASUB_B:
					reg_a <= reg_a - reg_b;
				ALOAD_B:
					reg_a <= reg_b;
				AHOLD:
					reg_a <= reg_a;
			endcase
		end
end


//create reg_b and its mux
always_ff @(posedge clk, negedge reset_n) 
begin
  if (!reset_n)
	begin
		reg_b <= 0;
	end
  else
	begin
		case(mux_b)
			BLOAD_B: 
				reg_b <= b_in;
			BLOAD_A:
				reg_b <= reg_a;
			BHOLD:
				reg_b <= reg_b;
		endcase
	end
end
		

//create the combinatorial signals that will steer the state machine 
assign a_lt_b = (reg_a < reg_b); 
assign b_neq_zero = (reg_b != 0);

//create the output signal from the internal register output
assign result = reg_a;

//declare the enumerated values for gcd_sm
  enum reg [1:0]{
	IDLE = 2'b00,
	RUN =  2'b01,
	DONE = 2'b10,
	XX =    'x
}p_state,n_state;

//build the present state storage for the state machine
always_ff @(posedge clk, negedge reset_n)
    if (!reset_n) 
		p_state <= IDLE;
	else
		p_state <= n_state;

//build the next state combo logic for the state machine
always_comb 
begin
  n_state = XX;       //default _ns assignment
  case (p_state)  
	IDLE:
		begin
			if(start)
				n_state = RUN;
			else
				n_state = IDLE;
		end
	RUN:
		begin
			if(a_lt_b)
				n_state = RUN;
			else if (b_neq_zero)
				n_state = RUN;
			else
				n_state = DONE;
		end
	DONE:
		n_state = IDLE;
  endcase
end
//form the state machine mealy outputs here
always_comb 
begin
  mux_a = AHOLD;  //default assignments
  mux_b = BHOLD;
  done = 1'b0;
    case (p_state)
		IDLE:
			if(start)
				begin
					mux_a = ALOAD_A;
					mux_b = BLOAD_B;
				end
			else
				begin
					mux_a = AHOLD;
					mux_b = BHOLD;
				end
		RUN:
			if(a_lt_b)
				begin
					mux_a = ALOAD_B;
					mux_b = BLOAD_A;
				end
			else if(b_neq_zero)
				begin
					mux_a = ASUB_B;
					mux_b = BHOLD;
				end
			else
				begin
					mux_a = AHOLD;
					mux_b = BHOLD;
				end
		DONE:
			begin
				mux_a = AHOLD;
				mux_b = BHOLD;
				done = 1;
			end
	endcase
end
endmodule