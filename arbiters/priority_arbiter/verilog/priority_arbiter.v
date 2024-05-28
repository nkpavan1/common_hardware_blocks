//Signle-cycle Parameterized prority arbiter
//coded with 3 assign statements

module priority_arbiter
#(parameter N=4)(
input   wire          clk,
input   wire          reset,
input   wire [N-1:0]  req_i,
output  wire [N-1:0]  gnt_o
);

wire [N-1:0] higher_pri_reqs;

//create an intermediate mask higher_pri_reqs[3] = higher_pri_reqs[2] | req_i[2];
assign higher_pri_reqs[N-1:1] = higher_pri_reqs[N-2:0] | req_i[N-2:0];
assign higher_pri_reqs[0] = 1'b0;
assign gnt_o[N-1:0] = req_i[N-1:0] & ~higher_pri_reqs[N-1:0];



endmodule