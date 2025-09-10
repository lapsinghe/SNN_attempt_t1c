`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 06:28:05 PM
// Design Name: 
// Module Name: tb_snn
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

module tb_snn(

    );
    
    logic i_clk = 0;
    reg i_rstn;
    reg [7:0] i_data0;
    reg [7:0] i_data1;
    reg [7:0] i_data2;
    wire [7:0] o_data0;
    wire [7:0] o_data1;
    wire [7:0] o_data2;
    
    
    localparam CLK_PERIOD = 10.5;
    
    always #(CLK_PERIOD/2) i_clk = ~i_clk;
    
    initial begin
        #(CLK_PERIOD)
        i_rstn = 0;
        #(CLK_PERIOD)
        i_rstn = 1;
    end
    
    initial begin
        #(CLK_PERIOD*5);
        i_data0 = 1;
        i_data1 = 2;
        i_data2  = 3;
        
        #(CLK_PERIOD*5);
        
        i_data0 = 0;
        i_data1 = 0;
        i_data2  = 0;
        
        #(CLK_PERIOD*5);       
   
        i_data0 = 10;
        i_data1 = 20;
        i_data2  = 30;
        
        #(CLK_PERIOD*5);  
        
        
        i_data0 = 0;
        i_data1 = 0;
        i_data2  = 0;
        
        #(CLK_PERIOD*5); 
 
        i_data0 = 1;
        i_data1 = 1;
        i_data2  = 1;
        
        #(CLK_PERIOD*5);        

        i_data0 = 0;
        i_data1 = 0;
        i_data2  = 0;
        
        #(CLK_PERIOD*5); 
        i_data0 = 40;
        i_data1 = 40;
        i_data2  = 40;
               
        
        $finish;                
    end
    
    snn_top DUT (
        .i_clk(i_clk),
        .i_rstn(i_rstn),
        .i_data0(i_data0),
        .i_data1(i_data1),
        .i_data2(i_data2),
        .o_data0(o_data0),
        .o_data1(o_data1),
        .o_data2(o_data2)
    
    );
    
endmodule
