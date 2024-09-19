`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 22:52:12
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(input clk,reset,input [3:0]ones,tens,hundreds,thousands,output reg[3:0]seg,output reg [3:0]digit);
    parameter ZERO  = 7'b0000001;  // 0
    parameter ONE   = 7'b1001111;  // 1
    parameter TWO   = 7'b0010010;  // 2 
    parameter THREE = 7'b0000110;  // 3
    parameter FOUR  = 7'b1001100;  // 4
    parameter FIVE  = 7'b0100100;  // 5
    parameter SIX   = 7'b0100000;  // 6
    parameter SEVEN = 7'b0001111;  // 7
    parameter EIGHT = 7'b0000000;  // 8
    parameter NINE  = 7'b0000100;  // 9
    
    reg [1:0] digit_select;     // 2 bit counter for selecting each of 4 digits
    reg [16:0] digit_timer;     // counter for digit refresh
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            digit_select <= 0;
            digit_timer <= 0; 
        end
        else                                        // 1ms x 4 displays = 4ms refresh period
            if(digit_timer == 99999) begin         // The period of 100MHz clock is 10ns (1/100,000,000 seconds)
                digit_timer <= 0;                   // 10ns x 100,000 = 1ms (99_999)
                digit_select <=  digit_select + 1;
            end
            else
                digit_timer <=  digit_timer + 1;
    end
   
    always @(digit_select) begin
        case(digit_select) 
            2'b00 : digit = 4'b1110;  
            2'b01 : digit = 4'b1101;   
            2'b10 : digit = 4'b1011;   
            2'b11 : digit = 4'b0111;  
        endcase
    end
    
    
    always @*
        case(digit_select)
            2'b00 : begin       // ONES DIGIT
                        case(ones)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                        endcase
                    end
                    
            2'b01 : begin       // TENS DIGIT
                        case(tens)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                        endcase
                    end
                    
            2'b10 : begin       // HUNDREDS DIGIT
                        case(hundreds)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                        endcase
                    end
                    
            2'b11 : begin       // MINUTES ONES DIGIT
                        case(thousands)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                        endcase
                    end
        endcase
endmodule
