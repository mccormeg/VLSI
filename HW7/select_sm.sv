module select_sm(
	input clk_mil,
	input reset_n,
	output logic [2:0]sel
);

	logic [2:0] sel_n;
	parameter S0 = 3'b000; //First digit
	parameter S1 = 3'b001; //Second digit
	parameter S2 = 3'b010; //Colon
	parameter S3 = 3'b011; //Third digit
	parameter S4 = 3'b100; //Fourth digit
	
	always_ff @ (posedge clk_mil, negedge reset_n)
		begin
			if(!reset_n)
				sel <= S0;
			else
				sel <= sel_n;

		end	
	always_comb
		begin
			case(sel)
				S0: sel_n = S1;
				S1: sel_n = S2;
				S2: sel_n= S3;
				S3:	sel_n = S4;
				S4: sel_n = S0;
				default: sel_n = S0;
			endcase
		end
endmodule		