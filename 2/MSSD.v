module MSSD(SerIn,clkPB,clock,reset,P0,P1,P2,P3,done,SerOutValid,ssd_result);
    input SerIn,clkPB,clock,reset;

    output P0,P1,P2,P3,done,SerOutValid;
    output [6:0] ssd_result;

    wire sh_en,clkEN,cnt1,sh_enD,cnt2,cntD,ldcntD,co1,co2,coD;

    datapath DP(SerIn,sh_en,clock,reset,clkEN,cnt1,sh_enD,cnt2,cntD,ldcntD,clkPB,P0,P1,P2,P3,ssd_result,co1,co2,coD);
    
    controller CU(SerIn,clkEN,clock,reset,co1,co2,coD,cnt1,cnt2,cntD,ldcntD,sh_en,sh_enD,SerOutValid,done);

endmodule