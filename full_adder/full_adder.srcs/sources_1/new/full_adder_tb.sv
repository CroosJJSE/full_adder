`timescale 1ns/1ps
module full_adder_tb ();// testbench doesnt have any ports // this is software not in hardware
// lets declare the variable of the uut (unit under test) port.
logic a=0,b=0,cin=0,sum,co;

// lets instantiate the dut
//full_adder uut(a,b,cin,sum,cout); // method 1
full_adder dut(.*);                 // method 2. preferred method

// lets start the simulation
initial begin
    // 1st dump the waveform.
    $dumpfile("full_adder.vcd"); $dumpvars(0,dut);
   #30 a = 1; b = 0; cin = 0; // Test case 1
    #10 a = 0; b = 0; cin = 1; // Test case 2
    #20 a = 1; b = 1; cin = 0; // Test case 3
    #10 a = 1; b = 0; cin = 0; // Test case 4
    #10 a = 0; b = 1; cin = 0; // Test case 5
    #10 a = 0; b = 0; cin = 1; // Test case 6
    #10 a = 1; b = 1; cin = 1; // Test case 7
    #10 a = 1; b = 0; cin = 1; // Test case 8
    #10 a = 0; b = 1; cin = 1; // Test case 9
    #10 a = 1; b = 1; cin = 0; // Test case 10

    // assert calculates the output and compares with the expected output.
    assert ({co,sum}==a+b+cin)
            $display("ok");  // if ok then display ok   
    else   $error("error"); // if not ok then display error

    #10 a <= 1; b <= 1; cin <= 1;
    #1 assert (dut.wire1 == 0)  // here we can check the internal wires also.
    else   $error("false.wire1: %d",dut.wire1); // here %d is used to display the value of the wire1 (string formating)
    $finish; // this is used to stop the simulation
end


    
endmodule