module wrapper_datapath(clk, rst, Ldx, shiftL , Vo,Ldu, Ui,engStart,wr_data,engDone);

    input clk, rst, Ldx, shiftL ,Ldu,engStart;
    input [15:0] Vo;
    input [1:0] Ui;

    output engDone;
    output [20:0] wr_data;

    wire [15:0] engx;

    wire [1:0]Ui_out;
    wire[1:0]intpart;
    wire[15:0] fracpart;

    comb_shift cs({intpart,fracpart},Ui_out,wr_data);

    exponential Exp(clk,rst,engStart, engx, engDone, intpart, fracpart);

    shift_register16 ShiftReg(clk, rst, Ldx, shiftL , Vo ,engx);

    register2 Ui_reg(clk, rst, Ldu, Ui ,Ui_out);

endmodule