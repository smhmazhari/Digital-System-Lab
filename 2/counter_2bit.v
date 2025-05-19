module counter_2bit(clock , reset, clkEN  ,cnt2 ,   co2);
    input clock , reset, clkEN  ,cnt2;
    output reg co2;

    reg [2:0] count;
    always @(posedge clock, posedge reset) begin
        if (reset) begin
            count <= 3'b0 ;
        end
        else if(clock && clkEN)
            if (cnt2) begin
                count <= count + 1;
            end
    end
    assign co2 = (count == 3'b101 ? 1'b1:1'b0);
endmodule