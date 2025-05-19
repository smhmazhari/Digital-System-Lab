`timescale 1 ns/ 100 ps
module register18 (input clk,rst,zero,init,ld, input [17:0] r_in, output reg [17:0] r_out);

	always@(posedge clk, posedge rst)begin
		if(rst == 1'b1)
			r_out <= 0;
		else
			if(zero == 1'b1)
				r_out <= 0;
			else if (init == 1'b1)
				r_out <= 16'hFFFF;
			else if(ld == 1'b1)
				r_out <= r_in;
	end
 endmodule



 module register8(clk,rst,load,reg_in,reg_out)
	input clk,rst,load;
	input [7:0] reg_in;
	output [7:0] reg_out;
	always@(posedge clk, posedge rst)begin
		if(rst == 1'b1)
			reg_out <= 8'b0;
		else if(load == 1'b1)
			reg_out <= reg_in;
	end

endmodule
result_reg_in = {{32-num_of_worthless}'b0,mult_res,{16-num_of_worthless}'b0}