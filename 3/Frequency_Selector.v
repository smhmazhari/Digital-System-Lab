module Frequency_Selector (clk , reset, ld ,parIn , co);
    input clk , reset, ld;
    input [4:0] parIn;
    output co;

    reg [8:0] count;

    reg [3:0] hardwired = 4'b0;
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            count <= {5'b0 , hardwired} ;
        end
        else 
        begin
            if (ld | co) begin
                count <= {parIn , hardwired};
            end
            else
                count <= count + 1;
        end
    end
    assign co = (count == 9'b1_1111_1111 ? 1'b1:1'b0);
endmodule