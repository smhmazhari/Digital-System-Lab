module Amp_Selector (waveform_generator_output,Amp_Sel,Amp_out);
    input [7:0] waveform_generator_output;
    input [1:0] Amp_Sel;
    output [7:0] Amp_out;

    assign Amp_out = waveform_generator_output >> Amp_Sel;
endmodule