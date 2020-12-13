`timescale 1ns / 1ps
module Data_Memory(
    Data_ad,
    Reg_read_data_2,
    Data_out,
    Clock,
    Data_Write
    );

parameter N=16;
parameter eff=10;   
 
input [N-1:0] Data_ad;
input [N-1:0] Reg_read_data_2;
input Clock;
input Data_Write;
output reg [N-1:0] Data_out;
wire [eff-1:0] Data_ad_w;
reg [N-1:0] data_mem [511:0];

assign Data_ad_w = Data_ad[eff-1:0];

initial 
	begin 
		$readmemh ("C:/Users/HP/AppData/Roaming/Xilinx/Vivado/data_mem.list",data_mem);
	end

always @ (*)
if (Data_Write==0)
	begin 
		Data_out = data_mem [Data_ad_w];
	end

always @ (posedge Clock)
   if (Data_Write==1)
		begin 
			data_mem [Data_ad_w]= Reg_read_data_2;
		end    
endmodule

