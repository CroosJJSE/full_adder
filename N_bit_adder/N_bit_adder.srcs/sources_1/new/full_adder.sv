module full_adder  (
    input logic signed a,b,cin,
    output logic signed sum,co
);
logic  wire1, wire2, wire3;
 assign wire1= a ^ b;
 assign wire2 = wire1 & cin;
 assign wire3 = a & b;

always_comb begin 
    sum= wire1 ^ cin;
    co = wire2 | wire3;    
end
    
endmodule