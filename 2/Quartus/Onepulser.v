module Onepulser(clkPB,clock,reset,clkEN);
    input clkPB,clock,reset;
    output reg clkEN; 
    reg [1:0] pstate , nstate;

    parameter [1:0] A = 0 , B = 1 , C = 2; 

    always @(posedge clock,posedge reset) 
    begin
        if(reset)
            pstate <= A;
        else
            pstate <= nstate;
    end

    always @(pstate , clkPB)
    begin
        case (pstate)
            A:nstate = clkPB ? B : A;
            B:nstate = C;
            C: nstate = ~clkPB ? A : C;
            default:nstate = A;
        endcase
    end

    always @(pstate)
    begin
        clkEN = 1'b0;
        case (pstate)
            B : clkEN = 1'b1;
        endcase
    end

endmodule