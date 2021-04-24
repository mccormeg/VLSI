module parser(
	input [11:0] raw_val,
	output logic [3:0] thousands,     //the 1000's digit
	output logic [3:0] hundreds,      //the 100's digit
	output logic [3:0] colon,		 //Colon and AM/PM
	output logic [3:0] tens,          //the 10's digit
	output logic [3:0] ones          //the 1's digit
);

	assign thousands = raw_val/1000;
	assign hundreds = (raw_val/100) % 10;
	assign tens = (raw_val/10) % 10;
	assign ones = raw_val % 10;
	assign colon = 15;
endmodule