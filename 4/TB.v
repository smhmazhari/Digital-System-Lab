`timescale 1ns/1ns
module TB();
    reg rst;
    reg clk = 0;

    reg w_start;
    reg [1:0] Ui;
    reg [4:0] Vi;

    wire [15:0] Vo;
    wire w_done,wr_req;
    wire [20:0] wr_data;

    concat DUT(Vi , Vo);

    wrapper CUT(clk , rst,w_start,Ui,Vo,w_done,wr_req,wr_data);

    always #100 clk = ~clk;
    initial begin
        rst = 1;
        #200 rst = 0;
        Vi = 5'b11111;
        Ui = 2'b00;

        #200 w_start = 0;
        #200 w_start = 1;
        #200 w_start = 0;

        #60000

        rst = 1;
        #200 rst = 0;
        Vi = 5'b10000;
        Ui = 2'b00;

        #200 w_start = 0;
        #200 w_start = 1;
        #200 w_start = 0;

        #60000

        rst = 1;
        #200 rst = 0;
        Vi = 5'b11111;
        Ui = 2'b01;

        #200 w_start = 0;
        #200 w_start = 1;
        #200 w_start = 0;

        #60000

        #60000 $stop ;
    end


endmodule