module DDS_waves(clk_star,reset,sine,full,half);
    input clk_star,reset;
    output [7:0] sine,full,half;
    wire sign_bit ,phase_pos;
    wire [5:0]addr;
    //(* romstyle = "M9K" *)(* ram_init_file = "sine.mif" *) reg [7:0] rom [0:63];
    reg [7:0] rom [0:63];
    
    initial begin
        $readmemb("sine.mem",rom);
    end
     phase_accumulator ph_a(clk_star,reset,sign_bit,phase_pos,addr);

    wire [5:0] mux1_out;
    wire [7:0] mux2_out;
    wire mux2_sel;

    assign mux1_out = (phase_pos==0)?addr: (~(addr) + 1'b1);

    assign mux2_sel = (~|addr) & phase_pos;

    assign mux2_out = (mux2_sel==0)? rom[mux1_out] : {8'b1111_1111};

    assign sine = (sign_bit == 0)?mux2_out:(~(mux2_out) + 1);
    assign full = mux2_out ;
    assign half = (sign_bit == 0)?mux2_out:(127);
endmodule