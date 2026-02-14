module cpu_tb;

reg clk = 0;
reg reset = 1;

cpu_top DUT(clk, reset);

always #5 clk = ~clk;

initial begin
    #10 reset = 0;
    #200 $stop;
end

endmodule
