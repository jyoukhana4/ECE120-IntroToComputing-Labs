module xor_top_tb;

    timeunit 10ps;
    timeprecision 10ps;

    bit clk;
    initial clk = 1'b1;
    always #(1) clk = ~clk;

    logic a, b, c;
    xor_tutorial dut(.*);

    function logic expected_output(logic a, logic b, logic c);
        expected_output = a ^ b;
    endfunction

    function logic actual_output(logic a, logic b, logic c);
        actual_output = c;
    endfunction

    initial begin
        for (logic [1:0] i = 0; i < 2; ++i) begin
            for (logic [1:0] j = 0; j < 2; ++j) begin
                a <= i[0];
                b <= j[0];
                @(posedge clk)

                assert (expected_output(a, b, c) === actual_output(a, b, c)) 
                else begin
                    $error("%0t: Incorrect output detected, should be %x, but is %x", $time, expected_output(a, b, c), actual_output(a, b, c));
                end
            end
        end

        $finish;
    end

endmodule : xor_top_tb