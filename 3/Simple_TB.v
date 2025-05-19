module Simple_TB();
    reg reset;
    reg clk_star = 0;
    wire [7:0] sq , tr , re;

    Simple_waves CUT (clk_star,reset,sq,tr,re);

    always #100 clk_star = ~clk_star;
    initial begin
        reset = 1;
        #100 reset = 0;
    #1000 $stop ;
    end

endmodule

module TB ();
    reg clk = 0;
    reg reset,key;
    reg [4:0] ParIn;
    reg [2:0] WaveType;
    reg [1:0] AmpSel;
    wire pwm_out;

    datapath CUT(clk , reset, key, ParIn,WaveType,AmpSel,pwm_out);

    always #100 clk = ~clk;
    initial begin
        ParIn = 5'b11111;
        WaveType = 3'b000;
        AmpSel = 2'b00;

        reset = 1;
        #100 reset = 0;

        #100 key = 1 ;
        #200 key = 0 ;

        #500 WaveType = 2;


    #10000000 $stop ;
    end

endmodule