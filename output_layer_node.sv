`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 01:00:58 AM
// Design Name: 
// Module Name: output_layer_node
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


module output_layer_node(
    input i_clk,
    input i_rstn,
    input [7:0] i_data0,
    input [7:0] i_data1,
    input [7:0] i_data2,
    input [7:0] i_data3,
    output reg [7:0] o_data
    );
    parameter THRESHOLD = 1;

    reg [7:0] sum; 
    
    always_comb sum = i_data0 + i_data1 + i_data2 + i_data3;
    
    always @ (posedge i_clk or negedge i_rstn) begin
        if (!i_rstn) begin
            o_data <= 0;

        end         
        else begin
            if ( sum >= THRESHOLD ) begin
                o_data <= sum;
            end
            
            else begin
                o_data <= 0;
            end       
        end   
    end           
endmodule
