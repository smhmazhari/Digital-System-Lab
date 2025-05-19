module TB ();

    reg reset,clkPB,SerIn;
    reg clock = 0;
    wire P0,P1,P2,P3,done,SerOutValid;
    wire [6:0] ssd_result;

    MSSD CUT(SerIn,clkPB,clock,reset,P0,P1,P2,P3,done,SerOutValid,ssd_result);

    0100011010
    always #100 clock = ~clock;
    initial begin
        reset = 1; clkPB = 0; SerIn = 1;

        #100 reset = 0;

        #100 SerIn = 0;//start of packet 1
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 1;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 0;
        #100 clkPB = 1;
        #500 clkPB = 0;
        //End of first counter
        #100 SerIn = 0;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 0;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 1;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 1;
        #100 clkPB = 1;
        #500 clkPB = 0;
        //End of second counter
        #100 SerIn = 0;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 1;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 0;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 1;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 1;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 1;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 1;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 1;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 1;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #100 SerIn = 1;
        #100 clkPB = 1;
        #500 clkPB = 0;

        #1000 $stop;
    end
endmodule