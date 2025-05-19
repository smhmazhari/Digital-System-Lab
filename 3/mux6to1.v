module mux6to1(in1,in2,in3,in4,in5,in6,mux_out,mux_sel);
    input [7:0] in1,in2,in3,in4,in5,in6;
    output reg [7:0] mux_out;
    input[2:0] mux_sel;

    always @(mux_sel, in1,in2,in3,in4,in5,in6) begin
        mux_out = in1;
        case (mux_sel)
            0: mux_out = in1;
            1: mux_out = in2;
            2: mux_out = in3;
            3: mux_out = in4;
            4: mux_out = in5;
            5: mux_out = in6;
            default:mux_out = in1;
        endcase
    end
endmodule