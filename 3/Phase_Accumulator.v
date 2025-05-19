module phase_accumulator (clk_star,reset,sign_bit,phase_pos,addr);
    input clk_star , reset;
    output sign_bit,phase_pos;
    output [5:0] addr;
    datapath_acc dp(clk_star,reset,addr,co);
    controller_acc cu(clk_star,reset,co , sign_bit,phase_pos);
endmodule