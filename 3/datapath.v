module datapath (clk , reset, ld, parIn,mux_sel,Amp_Sel,pwm_out);
    input clk , reset, ld ;
    input [4:0] parIn ;
    input[2:0] mux_sel;
    input [1:0] Amp_Sel;
    output pwm_out;

    wire [7:0] amp_out;

    wire clk_star;
    wire [7:0] square,triangle,reciprocal,sine,full,half;
    wire [7:0] waveform_generator_output;
    
    Frequency_Selector Freq (clk , reset, ld ,parIn , clk_star);
    DDS_waves DDS(clk_star,reset,sine,full,half);
    Simple_waves WG (clk_star,reset,square,triangle,reciprocal);
    Amp_Selector AMP (waveform_generator_output,Amp_Sel,amp_out);
    PWM pwm(clk,reset,amp_out,pwm_out);
    mux6to1 mux(square,triangle,reciprocal,sine,full,half,waveform_generator_output,mux_sel);
endmodule