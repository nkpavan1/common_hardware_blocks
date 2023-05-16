module sync_fifo
        #(parameter DWIDTH = 8, AWIDTH=1)
        (   input clk, rst_n, //sync active-low reset
            input rd, wr,
            input [DWIDTH-1:0] wr_data,

            output [DWIDTH-1:0] rd_data,
            output fifo_full, fifo_empty
        );

//internal signals

//FIFO Array
reg [DWIDTH-1:0] fifo_mem[2**AWIDTH-1:0];
reg [AWIDTH-1:0] rd_ptr, wr_ptr;
//Reset Values
always@(posedge clk)
begin
    if(!rst_n)
        begin
            rd_ptr<=0;
            wr_ptr<=0;
            rd_data<=0;
        end    
end


//FIFO Write
always@(posedge clk)
begin
    if(wr & !fifo_full)begin
        fifo_mem[wr_ptr] <= wr_data;
        wr_ptr<=wr_ptr+1;
    end
end

//FIFO Read
always@(posedge clk)
begin
    if(rd & !fifo_empty)begin
    rd_data <= fifo_mem[rd_ptr];
    rd_ptr <= rd_ptr+1;
    end
end

assign fifo_empty = (rd_ptr == wr_ptr);
assign fifo_full = ((wr_ptr+1) == rd_ptr); 


endmodule