//parameterized shifter implementation
//log Funnel shifter
//More details @ http://pages.hmc.edu/harris/cmosvlsi/4e/lect/lect18.pdf

module shifter
#(parameter DATA_WIDTH = 32)
(
input logic[DATA_WIDTH-1:0]             shift_in_i,     //input to shifter
input logic[$clog2(DATA_WIDTH)-1:0]     shift_amount_i, //shift amount
input logic                             arith_shift_i,  //arithmetic or logical shift
input logic                             left_shift_i,  //left or right shift

output logic[DATA_WIDTH-1:0]            shift_out_o   //shifter output
);

localparam XMSB = DATA_WIDTH-1;

logic[2*(DATA_WIDTH-1):0]       wider_shift_input; //2N-1 wide shifter input
logic[2*(DATA_WIDTH-1):0]       tmp_shift_output;//2N-1 wide shifter input
logic[$clog2(DATA_WIDTH)-1:0]   adj_shift_amount;
logic                           sign_bit;
logic[DATA_WIDTH-2:0]           zero_vec;

assign zero_vec = {XMSB{1'b0}};



assign sign_bit = shift_in_i[XMSB] & arith_shift_i; //sign bit only needed for arith shift


always_comb //form the 2N-1 wide shift input based on the shift direction
    if(left_shift_i)    wider_shift_input = {shift_in_i, zero_vec};
    else                wider_shift_input = {{XMSB{sign_bit}}, shift_in_i};

assign adj_shift_amount = left_shift_i ? ~shift_amount_i : shift_amount_i; 
  
  
assign tmp_shift_output = wider_shift_input >> adj_shift_amount;
assign shift_out_o = tmp_shift_output[DATA_WIDTH-1:0];    


endmodule