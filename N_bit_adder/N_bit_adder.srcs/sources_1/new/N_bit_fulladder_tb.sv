module N_bit_fulladder_tb();
timeunit 1ns;
timeprecision 1ps;
localparam N = 8 ; // N-bit full adder is parameterized so you need a local parameter to call the module
    // lets initialize our variables
    logic [N-1:0] a,b,sum;
    logic cin,co;
    N_bit_fulladder #(.N(N)) dut (.*); // parameterized module instantiation
    initial begin 
        $dumpfile("N_bit_fulladder.vcd");
        $dumpvars(0,dut);
        a<= 8'd5 ; b<= 8'd10 ; cin<= 1'b0 ; // initialize the inputs
        #1 assert(sum == 8'd15) else $error("error"); // check the output

        a<= 8'd10 ; b<= 8'd10 ; cin<= 1'b0 ; 
        a<= 8'd5 ; b<= 8'd110 ; cin<= 1'b0 ;

        repeat(10) begin
        #9
        std::randomize(cin);
        std::randomize(a) with {a inside {[-128:127]};};
        std::randomize(b) with {b inside{[-128:127]};};
        #1
        assert ({co,sum}==a+b+cin)
        else $error("%d + %d+ %d != {%d+%d}",a,b,cin,co,sum);
        
        end
            

    end
endmodule