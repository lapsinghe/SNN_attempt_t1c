`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 12:34:46 AM
// Design Name: 
// Module Name: snn_top
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


module snn_top(
    input i_clk,
    input i_rstn,
    input [7:0] i_data0,
    input [7:0] i_data1,
    input [7:0] i_data2,
    output [7:0] o_data0,
    output [7:0] o_data1,
    output [7:0] o_data2
    );
    
    wire [7:0] data_in_p [2:0];
    wire [7:0] mid_layer0_p [3:0];
    wire [7:0] mid_layer1_p [3:0];
    wire [7:0] data_out_p [2:0];
    
    wire [7:0] i_data_array [2:0];
    assign i_data_array[0] = i_data0;
    assign i_data_array[1] = i_data1;
    assign i_data_array[2] = i_data2;

    
    genvar i;
    generate 
        for (i = 0; i < 3; i = i + 1) begin : input_loop
            input_layer_node #(.THRESHOLD(i)) 
            input_node_inst (
                .i_clk(i_clk),
                .i_rstn(i_rstn),
                .i_data(i_data_array[i]),
                .o_data(data_in_p[i])                
            );  
        end 
    endgenerate
    
    genvar j;
    generate
        for (j = 0; j < 4; j = j + 1) begin : mid_layer0_loop
            middle_layer0 #(.THRESHOLD(j*2))
            middle_node0_inst (
                .i_clk(i_clk),
                .i_rstn(i_rstn),
                .i_data0(data_in_p[0]),
                .i_data1(data_in_p[1]),
                .i_data2(data_in_p[2]),
                .o_data(mid_layer0_p[j])
            );
        end    
    endgenerate

    genvar k;
    generate
        for (k = 0; k < 4; k = k + 1) begin : mid_layer1_loop
            middle_layer1 #(.THRESHOLD(k*3))
            middle_node1_inst (
                .i_clk(i_clk),
                .i_rstn(i_rstn),
                .i_data0(mid_layer0_p[0]),
                .i_data1(mid_layer0_p[1]),
                .i_data2(mid_layer0_p[2]),
                .i_data3(mid_layer0_p[3]),
                .o_data(mid_layer1_p[k])
            );
        end    
    endgenerate
       
       
    genvar m;
    generate
        for (m = 0; m < 3; m = m + 1) begin : out_layer_loop
            output_layer_node #(.THRESHOLD(m*4))
            middle_node1_inst (
                .i_clk(i_clk),
                .i_rstn(i_rstn),
                .i_data0(mid_layer1_p[0]),
                .i_data1(mid_layer1_p[1]),
                .i_data2(mid_layer1_p[2]),
                .i_data3(mid_layer1_p[3]),
                .o_data(data_out_p[m])
            );
        end    
    endgenerate
           
    assign o_data0 = data_out_p[0];       
    assign o_data1 = data_out_p[1];
    assign o_data2 = data_out_p[2];
endmodule
