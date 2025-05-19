module counter6bit(clk_star,reset,count,co);
    input clk_star , reset;
    output co;
    output reg [5:0] count;

    always @(posedge clk_star, posedge reset) begin
        if (reset) begin
            count <= 6'b0;
        end
        else
            count <= count + 1;
    end
    assign co = &count;
endmodule