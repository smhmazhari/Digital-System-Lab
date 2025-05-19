module wrapper_controller(w_start,clk , rst , engDone,wDone , wr_req,Ldx,Ldu,shiftL,engStart);
    input w_start,clk , rst , engDone;
    output reg wDone , wr_req,Ldx,Ldu,shiftL,engStart;

    parameter [2:0]  Idle = 0 , Init = 1, A = 2,B = 3 , C= 4;

    reg [2:0] pstate , nstate;
    wire co;
    reg cnt;

    counter2 cntr(clk,rst,cnt , co);

    always @(posedge clk,posedge rst) 
    begin
        if(rst)
            pstate <= Idle;
        else if(clk)
            pstate <= nstate;
    end

    always @(pstate,w_start,engDone,co)
    begin
        case (pstate)
            Idle: nstate = (w_start)? Init : Idle;
            Init: nstate = (!w_start) ? A : Init;
            A: nstate = B;
            B: nstate = engDone ? C : B;
            C: nstate = co ? Idle : A;
            default:nstate = Idle;
        endcase
    end

    always @(pstate)
    begin
        {wDone,Ldu,Ldx,engStart,shiftL,wr_req,cnt} = 7'b0;
        case (pstate)
            Idle:
            begin
                wDone <= 1;
            end
            Init:
            begin
                Ldu <= 1;
                Ldx <= 1;
            end
            A:
            begin
                engStart <= 1;
            end
            C:
            begin
                cnt <= 1;
                shiftL <= 1;
                wr_req <= 1;
            end
        endcase
    end

endmodule