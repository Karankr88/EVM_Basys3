`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 22:48:34
// Design Name: 
// Module Name: voting_mach
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


module voting_mach(input clk,reset,NDA,INDIA,NOTA,NDA_GET,INDIA_GET,NOTA_GET,output reg NDA_CONF,INDIA_CONF,NOTA_CONF,output [6:0] seg,output [3:0]digit);
reg [9:0] NDA_COUNT = 0,INDIA_COUNT = 0,NOTA_COUNT = 0;
wire [3:0]ones,tens,hundreds,thousands;
digit digit_2(clk,reset,NDA_GET,INDIA_GET,NOTA_GET,NDA_COUNT,INDIA_COUNT,NOTA_COUNT,ones,tens,hundreds,thousands);
seven_seg seven_segm_3(clk,reset,ones,tens,hundred,thousands,seg,digit);
reg[31:0] count = 0;
always @(posedge clk)
begin
    if(reset)
    begin
        NDA_COUNT <= 0;
        INDIA_COUNT <= 0;
        NOTA_COUNT <= 0;
    end
    else
    begin
            if(NDA)
            begin
                if(count < 50000000)
                count <= count +1;
                else
                begin
                   if(NDA && count == 50000000)
                    begin
                    NDA_CONF <= 1'b1;
                    count <= count+1;
                    NDA_COUNT <= NDA_COUNT +1;
                    end
                   else
                    begin
                    NDA_CONF <= 1'b1;
                    count <= count +1;
                    NDA_COUNT <= NDA_COUNT;
                    end
                end
            end
            else if(INDIA)
            begin
                if(count < 50000000)
                count <= count +1;
                else
                begin
                   if(INDIA && count == 50000000)
                    begin
                    INDIA_CONF <= 1'b1;
                    count <= count+1;
                    INDIA_COUNT <= INDIA_COUNT +1;
                    end
                   else
                    begin
                    INDIA_CONF <= 1'b1;
                    count <= count +1;
                    INDIA_COUNT <= INDIA_COUNT;
                    end
                end
            end
            else if(NOTA)
            begin
                if(count < 50000000)
                count <= count +1;
                else
                begin
                   if(NOTA && count == 50000000)
                    begin
                    NOTA_CONF <= 1'b1;
                    count <= count+1;
                    NOTA_COUNT <= NOTA_COUNT +1;
                    end
                   else
                    begin
                    NOTA_CONF <= 1'b1;
                    count <= count +1;
                    NOTA_COUNT <= NOTA_COUNT;
                    end
                end
            end
            else
            begin
            count <=0;
            NDA_CONF <= 0;
            INDIA_CONF <= 0;
            NOTA_CONF <= 0;
            end
       end
end
endmodule

