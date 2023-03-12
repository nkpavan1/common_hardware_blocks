module any_edge_detection( //both pos and neg edge detector
	input clk,
	input [7:0] in,
	output reg [7:0] anyedge);
	
	reg [7:0] d_prev;	
			
	always @(posedge clk) begin
		d_prev <= in;			// Remember the state of the previous cycle
		anyedge <= in  ^ d_prev;	
	end
	
endmodule