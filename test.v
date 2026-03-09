module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    
    always @ (posedge clk) begin
        if ( reset ) begin
            pm=0;
            hh=8'h12;
            mm=8'h0;
            ss=8'h0;
        end
        else begin
            if ( ena ) begin
                
                if ( (mm==8'h59)&(ss==8'h59) ) begin
                    if (hh==8'h11)
                        pm=~pm;
                   	else
                        hh=8'h1;
                end
                else begin
                
                    if ( ss==8'h59 ) begin
                        ss=8'h0;

                        if ( mm[3:0]==4'd9 ) begin
                            mm[7:4]=mm[7:4]+4'd1;
                            mm[3:0]=4'd0;    
                        end
                        else
                            mm[3:0]=mm[3:0]+4'd1;

                    end
                    else begin
                        if ( ss[3:0]==4'd9 ) begin
                            ss[7:4]=ss[7:4]+4'd1;
                            ss[3:0]=4'd0; 
                        end
                        else 
                            ss[3:0]=ss[3:0]+4'd1; 
                    end

                    if ( mm==8'h59 ) begin
                        mm=8'h0;
                        if ( hh[3:0]==4'd9 ) begin
                            hh[3:0]=4'd0;
                            hh[7:4]=hh[7:4]+4'd1;
                        end
                        else
                            hh[3:0]=hh[3:0]+4'd1;
                    end
                end
            end
        end
    end

endmodule
