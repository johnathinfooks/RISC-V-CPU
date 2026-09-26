`timescale 1ns / 1ps

module tb_ripple_carry_adder;

logic [31:0] tb_a;
logic [31:0] tb_b;
logic        tb_c_in;
logic [31:0] tb_sum;
logic        tb_c_out;
logic [32:0] expected;

ripple_carry_adder uut (
    .a(tb_a),
    .b(tb_b),
    .c_in(tb_c_in),
    .sum(tb_sum),
    .c_out(tb_c_out)
);

initial begin : randomized_test

    localparam int NUM_CASES = 10_000;

    for (int i = 0; i < NUM_CASES; i++) begin

        tb_a    = $urandom;
        tb_b    = $urandom;
        tb_c_in = $urandom_range(0, 1);

        #1;

        expected = {1'b0, tb_a}
                 + {1'b0, tb_b}
                 + tb_c_in;

        assert ({tb_c_out, tb_sum} === expected)
            else $fatal(
                "Failed case %0d: a=%h, b=%h, c_in=%b, sum=%h, c_out=%b, expected=%h",
                i,
                tb_a,
                tb_b,
                tb_c_in,
                tb_sum,
                tb_c_out,
                expected
            );
    end

    $display("All 'ripple_carry_adder' tests passed!");

    $finish;

end : randomized_test

endmodule : tb_ripple_carry_adder
