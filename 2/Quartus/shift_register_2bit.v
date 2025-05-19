module shift_register_2bit(clock,reset, clkEN,sh_en,SerIn , port_num);
    input clock,reset, clkEN,sh_en,SerIn;
    output reg [1:0] port_num;

    always @(posedge clock , posedge reset) begin
        if (reset) begin
            port_num <= 2'b0;
        end
        else if (clock && clkEN) begin
            if (sh_en) begin
                port_num <= {port_num[0],SerIn};
            end
        end
    end
endmodule