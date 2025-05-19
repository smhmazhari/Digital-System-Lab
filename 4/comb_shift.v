module comb_shift(comb_in,Ui_out,wr_data);
    input [17:0] comb_in;
    input [1:0] Ui_out;

    output [20:0] wr_data;

    assign wr_data = (Ui_out == 0) ? {3'b0,comb_in}:
                    (Ui_out == 1) ? {2'b0,comb_in,1'b0}:
                    (Ui_out == 2) ? {1'b0,comb_in,2'b0}:
                    (Ui_out == 3) ? {comb_in, 3'b0} : 21'bz;
endmodule