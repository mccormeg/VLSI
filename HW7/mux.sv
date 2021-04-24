module mux (
	input logic [2:0] sel,    
	input logic [3:0] thousands,     //the 1000's digit
	input logic [3:0] hundreds,      //the 100's digit
	input logic [3:0] colon,		 //Colon and AM/PM
	input logic [3:0] tens,          //the 10's digit
	input logic [3:0] ones,          //the 1's digit
	output logic [3:0] value  //the selected digit
 ); 

  always_comb
    case(sel)  		       
      0:	value = ones;
	  1:	value = tens;
	  2:	value = colon;
	  3:	value = hundreds;
	  4:	value = thousands;
      default : value = ones;   //
    endcase
endmodule