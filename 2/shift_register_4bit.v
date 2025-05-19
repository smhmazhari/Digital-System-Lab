module shift_register_4bit(clock,reset, clkEN,sh_enD,SerIn , NumData);
    input clock,reset, clkEN,sh_enD,SerIn;
    output reg [3:0] NumData;

    always @(posedge clock , posedge reset) begin
        if (reset) begin
            NumData <= 4'b0;
        end
        else if (clock && clkEN) begin
            if (sh_enD) begin
                NumData <= {NumData[2:0],SerIn};
            end
        end
    end
endmodule