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
