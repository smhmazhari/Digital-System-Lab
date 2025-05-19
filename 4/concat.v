module concat(Vi , Vo);
    input [4:0] Vi;
    output [15:0] Vo;
    
    assign Vo = {3'b0 , Vi ,8'b0};
endmodule