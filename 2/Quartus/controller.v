module controller(SerIn,clkEN,clock,reset,co1,co2,coD,cnt1,cnt2,cntD,ldcntD,sh_en,sh_enD,SerOutValid,done);
    input SerIn,clkEN,clock,reset,co1,co2,coD;
    output reg cnt1,cnt2,cntD,ldcntD,sh_en,sh_enD,SerOutValid,done;

    parameter [1:0]  Init = 0 , A = 1, B = 2,C = 3;

    reg [1:0] pstate , nstate;

        always @(posedge clock,posedge reset) 
        begin
            if(reset)
                pstate <= Init;
            else if(clock && clkEN)
                pstate <= nstate;
        end

        always @(pstate , co1,co2,coD,SerIn)
        begin
            case (pstate)
                Init: nstate = SerIn? Init : A;
                A: nstate = co1 ? B : A;
                B: nstate = co2 ? C : B;
                C: nstate = coD ? Init : C;
                default:nstate = Init;
            endcase
        end

        always @(pstate, coD)
        begin
            {cnt1,cnt2,cntD,ldcntD,sh_en,sh_enD,SerOutValid,done} = 8'b0;
            case (pstate)
                A:
                begin
                    cnt1 = 1;
                    sh_en = 1;// ~co1
                    cnt2 = co1;
                    sh_enD = co1;
                end
                B:
                begin
                    cnt2 = 1;
                    sh_enD = 1;//~co2
                    ldcntD = co2;
                    SerOutValid = co2;
                end
                C:
                begin
                    cntD = 1;
                    SerOutValid = 1;
                    done = coD;
                end
            endcase
        end

endmodule