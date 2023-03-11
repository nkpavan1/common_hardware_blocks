module vector_reversal (
    input in[7:0],
    output out[7:0]
);

//Naive solution
assign {out[0], out[1], out[2], out[3] , out[4], out[5], out[6], out[7]} = in;

//With loop
/*always@(*)
begin
    for(integer i=0;i<100;i++)
        out[i] = in[99-i];

end*/


//With Genvar
/*generate
    genvar i;
    for(i=0;i<$bits(out);i++) begin: bit_rev
        assgin out[i] = in[$bits(out) -i -1];
    end
endgenerate
*/
    
endmodule