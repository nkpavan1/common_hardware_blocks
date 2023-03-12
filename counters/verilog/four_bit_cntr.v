module four_bit_cntr (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] cnt);

    always@(posedge clk)
        begin
            if(reset)
                cnt <= 4'b0;
            else
                cnt <= cnt+1'b1;
        end
endmodule