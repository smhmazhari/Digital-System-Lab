module SSD (count,ssd_result);
    input [3:0] count;
    output reg [6:0] ssd_result;

    always @(count) begin
        {ssd_result} = 7'b0;
        case (count) 
            4'h0:ssd_result = 7'h40;
            4'h1:ssd_result = 7'h79;
            4'h2:ssd_result = 7'h24;
            4'h3:ssd_result = 7'h30;
            4'h4:ssd_result = 7'h19;
            4'h5:ssd_result = 7'h12;
            4'h6:ssd_result = 7'h02;
            4'h7:ssd_result = 7'h78;
            4'h8:ssd_result = 7'h00;
            4'h9:ssd_result = 7'h10;
            4'ha:ssd_result = 7'h08;
            4'hb:ssd_result = 7'h03;
            4'hc:ssd_result = 7'h46;
            4'hd:ssd_result = 7'h21;
            4'he:ssd_result = 7'h06;
            4'hf:ssd_result = 7'h0e;
            default: ssd_result = 7'b0;
        endcase
    end
endmodule