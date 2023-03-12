module edge_detection( //positive edge detector
	input clk,
	input [7:0] in,
	output reg [7:0] pedge);
	
	reg [7:0] d_prev;	
			
	always @(posedge clk) begin
		d_prev <= in;			// Remember the state of the previous cycle
		pedge <= in & ~d_prev;	// A positive edge occurred if input was 0 and is now 1.
	end
	
endmodule
