module shift_register16(clk, rst, Ldx, shiftL , Vo ,engx);
    input clk, rst, Ldx, shiftL;
    input [15:0] Vo;
    output reg [15:0] engx;

    always @(posedge clk , posedge rst) begin
        if (rst) begin
            engx <= 16'b0;
        end
        else if (clk) begin
            if (Ldx) begin
                engx <= Vo;
            end
            else if(shiftL) begin
                engx <= {engx[14:0] , 1'b0};
            end
        end
    end
endmodule