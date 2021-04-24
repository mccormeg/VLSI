module clock(
  input             reset_n,             //reset pin
  input             clk_1sec,            //1 sec clock
  input             clk_1ms,             //1 mili sec clock
  input             mil_time,            //mil time pin
  output reg [6:0]  segment_data,        // output 7 segment data
  output reg [2:0]  digit_select         // digit select
  );
/*******************************************************************
** Wires and Register
*******************************************************************/
	wire [3:0] thou;
	wire [3:0] hund;
	wire [3:0] tens;
	wire [3:0] ones;
	wire [3:0] col;
	wire [3:0] sel_data;
	reg	 [5:0] sec_count;
	reg  [5:0] min_count;
	reg	 [5:0] hour_count;
	logic [11:0] clk_data;
	logic am_pm = 0;

/********************************************************************
**	Find minutes, and hours
********************************************************************/

always_ff @(posedge clk_1sec, negedge reset_n)
	begin
	sec_count <= sec_count + 1;
		if(~reset_n)
			begin
				sec_count  <= 0;
				min_count  <= 0;
				hour_count <= 0;
			end
		else if(mil_time == 1)
			begin
				if(sec_count == 59)
					begin
						min_count <= min_count + 1;
						sec_count <= 0;
					end
				if(min_count == 59 && sec_count == 59)
					begin
						hour_count <= hour_count + 1;
						min_count <= 0;
					end
				if(am_pm == 1)
					begin
						hour_count <= hour_count + 12;
						am_pm <= 0;
					end
				if(hour_count == 23 && min_count == 59 && sec_count == 59)
					hour_count <= 0;
			end
		else
			begin
				if(hour_count == 0)
					hour_count <= 12;
				if(sec_count == 59)
					begin
						min_count <= min_count + 1;
						sec_count <= 0;
					end
				if(hour_count == 12 && min_count == 59 && sec_count == 59)
					hour_count <= 1;
				if(min_count == 59 && sec_count == 59)
					begin
						hour_count <= hour_count + 1;
						min_count <= 0;
					end
				if(hour_count > 12)
					begin
						hour_count <= hour_count - 12;
						am_pm <= 1;
					end
				if(hour_count == 12 && sec_count == 0 && min_count == 0 )
						am_pm <= ~am_pm;
			end
	end
	
assign clk_data = ((hour_count * 100) + (min_count));
/*******************************************************************
** Instantiations
*******************************************************************/
  select_sm sm1(
	.clk_mil(clk_1ms),
	.reset_n(reset_n),
	.sel(digit_select)
  );
  
  parser par1(
	.raw_val(clk_data),
	.thousands(thou),     //the 1000's digit
	.hundreds(hund),      //the 100's digit
	.colon(col),		 //Colon and AM/PM
	.tens(tens),          //the 10's digit
	.ones(ones)          //the 1's digit
  );
  mux mux1(
	.sel(digit_select),    
	.thousands(thou),     //the 1000's digit
	.hundreds(hund),      //the 100's digit
	.colon(col),		 //Colon and AM/PM
	.tens(tens),          //the 10's digit
	.ones(ones),          //the 1's digit
	.value(sel_data)  //the selected digit
  ); 
  decoder decode(
	.data(sel_data),
	.segments(segment_data)
  );
 endmodule