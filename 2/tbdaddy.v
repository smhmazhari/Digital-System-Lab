`timescale 1ns/1ns
module tbdaddy();
    reg clock = 0;
    reg SerIn, reset, clkPB;
    wire P0,P1,P2,P3,done, SerOutValid;
    wire[6:0] ssd_result;

    MSSD CUT1 (SerIn,clkPB,clock,reset,P0,P1,P2,P3,done,SerOutValid,ssd_result);

    always #50 clock = ~clock;

    initial begin
        reset = 1;
        #100 reset = 0;
        #500 clkPB = 1;
        SerIn=1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        SerIn =0;
        #500 clkPB = 0;
        #500 clkPB = 1;
        SerIn = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        SerIn = 0;
        #500 clkPB = 0;
        #500 clkPB = 1;
        SerIn =1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        SerIn = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        SerIn = 0;
        #500 clkPB = 0;
        #500 clkPB = 1;
        SerIn = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        SerIn = 0;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #500 clkPB = 0;
        #500 clkPB = 1;
        #10000;
        $stop;
    end

endmodule
