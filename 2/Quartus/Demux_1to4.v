module Demux_1to4 (SerIn,port_num,P0,P1,P2,P3);
    input [1:0] port_num;
    input SerIn;
    output reg  P0,P1,P2,P3;

    always @(SerIn) begin
        {P0,P1,P2,P3} = 4'b0;
        case (port_num)
            0:P0 = SerIn;
            1:P1 = SerIn;
            2:P2 = SerIn;
            3:P3 = SerIn;
        endcase
    end


endmodule