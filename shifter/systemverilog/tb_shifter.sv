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

logic[7:0] pass_count, fail_count;

initial begin 
    pass_count = 0;
    fail_count = 0;
   repeat(100)
      begin
         run_shift_stimulus(0,1);         //logical left shift
         if (shift_out_t == shift_out_o)
            pass_count++;
         else
            fail_count++;    
      end
      $display("[Logical Left Shift]Number of Test cases Passed = %0d", pass_count);     
      $display("[Logical Left Shift]Number of Test cases Failed = %0d", fail_count);
      
      pass_count = 0;fail_count=0;
      repeat(100)
      begin
         run_shift_stimulus(0,0);         //logical Right shift
         if (shift_out_t == shift_out_o)
            pass_count++;
         else
            fail_count++;    
      end
      $display("[Logical Right Shift]Number of Test cases Passed = %0d", pass_count);     
      $display("[Logical Right Shift]Number of Test cases Failed = %0d", fail_count);
      
      pass_count = 0;fail_count=0;
      repeat(100)
      begin
         run_shift_stimulus(1,1);         //Arithmetic Left shift
         if (shift_out_t == shift_out_o)
            pass_count++;
         else
            fail_count++;    
      end
      $display("[Arithmetic Left Shift]Number of Test cases Passed = %0d", pass_count);     
      $display("[Arithmetic Left Shift]Number of Test cases Failed = %0d", fail_count);
      
      pass_count = 0;fail_count=0;
      repeat(100)
      begin
         run_shift_stimulus(1,0);         //Arithmetic Right shift
         if (shift_out_t == shift_out_o)
            pass_count++;
         else
            fail_count++;    
      end
      $display("[Arithmetic Right Shift]Number of Test cases Passed = %0d", pass_count);     
      $display("[Arithmetic Right Shift]Number of Test cases Failed = %0d", fail_count);
      
      $finish;
end

task run_shift_stimulus;    
   
logic[31:0] shift_in_t;
logic[4:0] shift_amount_t;
input logic arith_shift_t, left_shift_t;

   begin 
   shift_in_t   = $random;   //random input
   shift_amount_t   = $random;   //random input
    
   shift_in_i   = shift_in_t;         
   shift_amount_i   = shift_amount_t;        
   arith_shift_i = arith_shift_t;
   left_shift_i = left_shift_t;         
   
   if(arith_shift_t ==0 & left_shift_t == 1)begin //logical left shift 
   shift_out_t = (shift_in_i) << shift_amount_t;#5;end 
   else if(arith_shift_t ==0 & left_shift_t == 0)begin //logical right shift 
   shift_out_t = (shift_in_i) >> shift_amount_t;#5;end
    else if(arith_shift_t ==1 & left_shift_t == 1)begin //arithmetic left shift 
   shift_out_t = $signed(shift_in_i) <<< shift_amount_t;#5;end
    else if(arith_shift_t ==1 & left_shift_t == 0)begin //arithmetic right shift 
   shift_out_t = $signed(shift_in_i) >>> shift_amount_t;#5;end
   
   end
    
endtask     



endmodule