`timescale 1ns / 1ps

module ripple_carry_adder (
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  logic        c_in,
    output logic [31:0] sum,
    output logic        c_out
);

logic [32:0] carry;
assign carry[0] = c_in;
assign c_out = carry[32];

generate

    for (genvar i = 0; i < 32; i++) begin
        full_adder fa (
            .a(a[i]),
            .b(b[i]),
            .c_in(carry[i]),
            .sum(sum[i]),
            .c_out(carry[i+1])
        );
    end

endgenerate

endmodule : ripple_carry_adder
