module counter8bit(clk_star,reset,count,co);
    input clk_star , reset;

    output co;
    output reg [7:0] count;

    always @(posedge clk_star, posedge reset) begin
        if (reset) begin
            count <= 8'b0;
        end
        else
            count <= count + 1;
    end
    assign co = (count == 8'b1111_1111 ? 1'b1:1'b0);
endmodule