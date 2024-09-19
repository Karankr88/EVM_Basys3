`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 22:50:48
// Design Name: 
// Module Name: digit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module digit(input clk,reset,NDA_GET,INDIA_GET,NOTA_GET ,input [9:0] NDA_COUNT,INDIA_COUNT,NOTA_COUNT,output reg [3:0] ones,tens,hundreds,thousands);
reg [9:0] temp_count = 0;
always @(posedge clk or posedge reset)
  begin
  if(reset)
     begin 
     ones <= 0;
     tens <= 0;
     hundreds <= 0;
     thousands <= 0;
     temp_count <= 0;
     end
   else
     begin
      if(NDA_GET) begin
        temp_count <= NDA_COUNT;
        end
      else if(INDIA_GET) begin
        temp_count <= INDIA_COUNT;
        end
      else if(NOTA_GET) begin
        temp_count <= NOTA_COUNT;
        end
      else
       temp_count <= 0;
     ones <= temp_count % 10;
     tens <= (temp_count/10)%10;
     hundreds <= (temp_count/100)%10;
     thousands <= (temp_count/1000)%10;
    end
  end
endmodule