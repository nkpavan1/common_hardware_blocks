//Self checking teshbench for shifter module

module tb_shifter();

logic[31:0] shift_in_i, shift_out_o, shift_out_t;
logic[4:0] shift_amount_i;
logic arith_shift_i, left_shift_i;

shifter #(32) shifter_dut
(
.shift_in_i(shift_in_i),    //input to shifter
.shift_amount_i(shift_amount_i), //shift amount
.arith_shift_i(arith_shift_i),  //arithmetic or logical shift
.left_shift_i(left_shift_i),   //left or right shift

.shift_out_o    //shifter output
);


initial begin 
   repeat(100)
      begin
         run_shift_stimulus();                                //instantiating task
         if (shift_out_t == shift_out_o)  //condition to check DUT outputs and calculated 
                                                    //outputs from task are equal 
            $display("Test case Passed");     

         else
            $display("Test case Failed");     
      
      end
      $finish;
end

task run_shift_stimulus;    
   
logic[31:0] shift_in_t;
logic[4:0] shift_amount_t;
logic arith_shift_t, left_shift_t;

   begin 
   shift_in_t   = $random;   //random input
   shift_amount_t   = $random;   //random input
   arith_shift_t  = 0;
   left_shift_t = 0;

    
   shift_in_i   = shift_in_t;         
   shift_amount_i   = shift_amount_t;        
   arith_shift_i = arith_shift_t;
   left_shift_i = left_shift_t;         
    
   shift_out_t = shift_in_i >> shift_amount_t;#5; 
   
   end
    
endtask     



endmodule