timeunit 1ns;
timeprecision 1ps;
module N_bit_fulladder #(
    parameter N =4 // N-bit full adder here we are parameterizing
) (
    input logic signed [N-1:0] a,b,
    input logic cin,
    output logic signed [N-1:0] sum,
    output logic co
    );
    logic C [N-1:0];   // this is unpacked 
    // instead of using wire we are using logic to interconnect the N modules
    assign C[0] = cin;
    assign C[N]= co;
    // let connect N module together
    genvar i;
    for ( i =0; i<N; i=i+1)begin 

        full_adder fa(         // module instantiation
            .a (a[i]),
            .b (b[i]),
            .cin (C[i]),      // this two lines are used to 
            .co (C[i+1]),   // chain up all the module.
            .sum(sum[i])
        );
    end


    
endmodule