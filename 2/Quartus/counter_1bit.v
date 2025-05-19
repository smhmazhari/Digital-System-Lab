module counter_1bit(clock , reset, clkEN  ,cnt1 ,   co1);
    input clock , reset, clkEN  ,cnt1;
    output  co1;

    reg count;
    always @(posedge clock, posedge reset) begin
        if (reset) begin
            //{co1,count} <= 2'b0;
            count <= 1'b0 ;
        end
        else if(clock && clkEN)
            if (cnt1) begin
                //{co1,count} <= count + 1;
                count <= count + 1;
            end
    end
    assign co1 = (count == 1 ? 1'b1:1'b0);
endmodule