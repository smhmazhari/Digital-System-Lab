module wrapper(clk , rst,w_start,Ui,Vo,w_done,wr_req,wr_data);

    input w_start,clk , rst;
    input [1:0]Ui;
    input [15:0]Vo;

    output w_done,wr_req;
    output [20:0] wr_data;

    wire engDone,Ldu,Ldx,shiftL,engStart;
    wrapper_controller CU(w_start,clk , rst , engDone,w_done , wr_req,Ldx,Ldu,shiftL,engStart);

    wrapper_datapath DP(clk, rst, Ldx, shiftL , Vo,Ldu, Ui,engStart,wr_data,engDone);

endmodule