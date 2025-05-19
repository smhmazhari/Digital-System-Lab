module datapath (SerIn,sh_en,clock,reset,clkEN,cnt1,sh_enD,cnt2,cntD,ldcntD,clkPB,P0,P1,P2,P3,ssd_result,co1,co2,coD);
    input SerIn,sh_en,clock,reset,cnt1,sh_enD,cnt2,cntD,ldcntD,clkPB;

    output clkEN;
    output P0,P1,P2,P3,co1,co2,coD;
    output [6:0] ssd_result;

    wire [3:0] count;
    wire [3:0] NumData;
    wire [1:0] port_num;

    shift_register_2bit PortNum_shr(clock,reset, clkEN,sh_en,SerIn , port_num);

    counter_1bit Port_cnt (clock , reset, clkEN  ,cnt1 ,   co1);

    shift_register_4bit DataNum_shr(clock,reset, clkEN,sh_enD,SerIn , NumData);

    counter_2bit DataNum_cnt(clock , reset, clkEN  ,cnt2 ,   co2);

    counter_4bit_with_load DataTrans_cnt(clock , reset, clkEN  ,cntD ,NumData,co2, count, coD);//ldcntD jay co2

    SSD ssd(count,ssd_result);

    Onepulser onepulser(clkPB,clock,reset,clkEN);

    Demux_1to4 Demux(SerIn,port_num,P0,P1,P2,P3);

endmodule