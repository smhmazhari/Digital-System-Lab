module datapath_acc(clk_star,reset,count,co);
    input clk_star , reset;
    output co;
    output  [5:0] count;

    counter6bit counter (clk_star,reset,count,co);
endmodule
