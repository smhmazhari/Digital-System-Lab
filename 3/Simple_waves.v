module Simple_waves(clk_star,reset,square,triangle,reciprocal);
    input clk_star , reset;
    
    output [7:0] square , triangle , reciprocal;

    reg [7:0] count;
    wire co ;

    always @(posedge clk_star, posedge reset) begin
        if (reset) begin
            count <= 8'b0;
        end
        else
            count <= count + 1;
    end
    assign co = (count == 8'b1111_1111 ? 1'b1:1'b0);

    assign square = (count > 127) ? 8'b0 : 8'b1111_1111;
    assign triangle = (count > 127)? 512 - (2 * count) - 2 :2*count;
    assign reciprocal = (255)/(255 - count + 1);

endmodule