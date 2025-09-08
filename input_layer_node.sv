`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 01:00:58 AM
// Design Name: 
// Module Name: input_layer_node
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


module input_layer_node(
    input i_clk,
    input i_rstn,
    input [7:0] i_data,
    output reg [7:0] o_data
    );
    
    parameter THRESHOLD = 1;
    
    always @ (posedge i_clk or negedge i_rstn) begin
        if (!i_rstn) begin
            o_data <= 0;
        end         
        else begin
            if ( i_data >= THRESHOLD ) begin
                o_data <= i_data;          
            end
            
            else begin
                o_data <= 0;           
            end       
        end   
    end
    
endmodule
