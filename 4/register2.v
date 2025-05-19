module register2(clk, rst, Ldu, Ui ,Ui_out);
    input clk, rst, Ldu;
    input [1:0] Ui;
    output reg [1:0] Ui_out;

    always @(posedge clk , posedge rst) begin
        if (rst) begin
            Ui_out <= 2'b0;
        end
        else if (clk) begin
            if (Ldu) begin
                Ui_out <= Ui;
            end
        end
    end
endmodule