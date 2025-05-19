module counter2 (clk,rst,engDone , co);
    input clk,rst,engDone;
    output  co; 
    
    reg [1:0] count;
	    
    always @(posedge clk,posedge rst)
    begin
        if(rst)
            {count} <= 2'b0;
        else if(engDone)
            {count} <= count + 1;
    end
    assign co = (count == 2'b11)? 1: 0;
endmodule 