`define EVEN_PARITY 
module parity_generator
#(parameter #BUS_WIDTH = 8)
(
input [BUS_WIDTH-1:0] inp,
output                parity

);


#`ifdef EVEN_PARITY
assign parity = ^inp;  //Bit-wise XOR for Even pairty bit generation. Same is used for parity checking
#else
assign parity = ~^inp; //Bit-wise XNOR for Odd parity Generation
#`endif macro

endmodule