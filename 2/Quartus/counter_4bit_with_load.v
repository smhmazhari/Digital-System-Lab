module counter_4bit_with_load(clock , reset, clkEN  ,cntD ,NumData,ldcntD, count, coD);
    input clock , reset, clkEN  ,cntD , ldcntD;
    input [3:0] NumData;
    output  coD;
    output reg [3:0] count;

    always @(posedge clock, posedge reset) begin
        if (reset) begin
            count <= 4'b1111;
        end
        else if(clock && clkEN)begin
            if (ldcntD) begin
                count <= NumData;
            end
            else if(cntD) begin
                count <= count - 1;
            end
        end
    end
    assign coD = (count == 4'b0001 ? 1'b1:1'b0);
endmodule