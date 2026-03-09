`timescale 1ns/100ps
`include "counter.v" //加了比較保險，讓tb能讀到top module
module tb_counter;

parameter CLK_PERIOD = 10;

reg  CLK;
reg  RESET;
wire count_done;
//module be tested
counter t0 (
    .rst(RESET),
    .clk(CLK),
    .count_done(count_done)
);
//stimilu
initial begin
    CLK   = 1'b0;
    RESET = 1'b1;
end

initial begin
    #100
        RESET = 1'b0;
    #1000
        $finish;
end

always @(CLK)
    #(CLK_PERIOD/2) CLK <= !CLK;

/*iverilog */
initial begin            
    $dumpfile("wave.vcd");       //產生vcd name
    $dumpvars(0, tb_counter);    //tb module name
end

endmodule
