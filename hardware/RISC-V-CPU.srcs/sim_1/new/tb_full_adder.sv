`timescale 1ns / 1ps

module tb_full_adder;

logic tb_a;
logic tb_b;
logic tb_c_in;
logic tb_sum;
logic tb_c_out;

full_adder uut (
    .a(tb_a),
    .b(tb_b),
    .c_in(tb_c_in),
    .sum(tb_sum),
    .c_out(tb_c_out)
);

initial begin : unit_test

    localparam int NUM_CASES = 8;
    
    for (int i = 0; i < NUM_CASES; i++) begin
    
        {tb_a, tb_b, tb_c_in} = i[2:0];
        #1;
        
        assert ({tb_c_out, tb_sum} == tb_a + tb_b + tb_c_in)
            else $error("Failed: a=%b, b=%b, c_in=%b, sum=%b, c_out=%b",
                        tb_a, tb_b, tb_c_in, tb_sum, tb_c_out);
    end
    
    $display("All 'full_adder' tests pass!");
    $finish;

end : unit_test

endmodule : tb_full_adder
