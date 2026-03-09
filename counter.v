module counter(
    input clk,
    input rst,
    output reg count_done
);

reg [7:0] cnt;

always @ (posedge clk) begin
    if(rst) cnt <= 8'd0;
    else if(cnt >= 8'd10) cnt <= 8'd0;
    else cnt <= cnt + 8'd1;
end

always @ (posedge clk) begin
    if(rst)
        count_done <= 1'b0;
    else if(cnt == 8'd10)
        count_done <= 1'b1;
    else
        count_done <= 1'b0;
end

endmodule
