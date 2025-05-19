module PWM(clk,reset,amp_out,pwm_out);
    input clk,reset;
    input [7:0] amp_out;
    output pwm_out;

    wire [7:0]count;
    wire co;
    
    counter8bit counter(clk,reset,count,co);

    assign pwm_out = (count < amp_out) ? 1 : 0;

endmodule
    