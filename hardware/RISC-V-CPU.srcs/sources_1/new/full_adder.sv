`timescale 1ns / 1ps

module full_adder (
    input logic a,
    input logic b,
    input logic c_in,
    output logic sum,
    output logic c_out
);

always_comb begin

    sum = a ^ b ^ c_in;
    c_out = (a & b) | (c_in & (a ^ b));

end

endmodule : full_adder
