`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2023 09:42:28 PM
// Design Name: 
// Module Name: calc
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


//module Calc(
//input wire [7:0]x,y, 
//input wire zx,nx,zy,ny,f,no,
//output wire [7:0]o,zx_o,mul_zx,nx_o,mul_nx,zy_o,mul_zy,ny_o,mul_ny,f_o,mul_f,mul_no,
//output wire zr,ng);
////algo for operation 1
//wire [7:0]zx_o;
//wire [7:0]mul_zx;
//assign mul_zx={8{zx}};
//assign zx_o=x&(~mul_zx);
////algo for operation 2
//wire [7:0]nx_o;
//wire [7:0]mul_nx;
//assign mul_nx={8{nx}};
//assign nx_o=x^mul_nx;
////algo for operation3 
//wire [7:0]zy_o;
//wire [7:0]mul_zy;
//assign mul_zx={8{zy}};
//assign zy_o=y&(~mul_zy);
//// algo for operation 4
//wire [7:0]ny_o;
//wire [7:0]mul_ny;
//assign mul_nx={8{ny}};
//assign ny_o=y^mul_ny;
//// algo for operation 5 as here sequentialy the functions are proceeding and x any are updating after every operation
// wire [7:0]f_o;
// wire [7:0]mul_f;
// assign mul_f={8{f}};
// assign f_o=(~mul_f&(nx_o&ny_o))|(mul_f&(nx_o|ny_o));
// // algo for operation 6 
// wire [7:0]mul_no;
// assign mul_no={8{no}};
// assign o=f_o^mul_no;
// // algo for operation 7
// assign zr=~o[7]&~o[6]&~o[5]&~o[4]&~o[3]&~o[2]&~o[1]&~o[0];
// // operation 8
// assign nr=o[7];

module Calc(
    input [7:0] x,y,
    input zx,nx,zy,ny,f,no,
    output [7:0] o,
    output zr,ng
    );
    wire [7:0] X,Y;

    // Assigning the values of X and Y
    assign X = ((~zx)&(~nx))?x:((~zx)&nx)?(~x):(zx&(~nx))?8'b0:(~8'b0);
    assign Y = ((~zy)&(~ny))?y:((~zy)&ny)?(~y):(zy&(~ny))?8'b0:(~8'b0);

    // Assigning the final output
    assign o = ((f)&(~no))?(X&Y):((~f)&no)?((X&Y)):(f&(no))?(X+Y):((X+Y));

    // Output control bit for zr
    assign zr = (o==0);

    // Output control bit for ng
    assign ng = o[7];

endmodule
