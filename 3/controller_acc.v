module controller_acc(clk_star,reset,co , sign_bit,phase_pos);

    input clk_star , reset;
    input co;

    output reg sign_bit , phase_pos;

    parameter [1:0]  A = 0 , B = 1, C = 2,D = 3;

    reg [1:0] pstate , nstate;

        always @(posedge clk_star,posedge reset) 
        begin
            if(reset)
                pstate <= A;
            else
                pstate <= nstate;
        end

        always @(pstate , co)
        begin
            case (pstate)
                A: nstate = co ? B : A;
                B: nstate = co ? C : B;
                C: nstate = co ? D : C;
                D: nstate = co ? A : D;
                default:nstate = A;
            endcase
        end

        always @(pstate)
        begin
            {sign_bit,phase_pos} = 2'b0;
            case (pstate)
                A:{sign_bit,phase_pos} = 2'b00;
                B:{sign_bit,phase_pos} = 2'b01;
                C:{sign_bit,phase_pos} = 2'b10;
                D:{sign_bit,phase_pos} = 2'b11;
                default:{sign_bit,phase_pos} = 2'b00;
            endcase
        end

endmodule