`timescale 1ns / 1ps

module Calc_tb;
    reg [7:0] x,y;
    reg zx,nx,zy,ny,f,no;
    reg clk;
    wire [7:0] o;
    wire zr,ng;
   integer fd;

    // Design under test
    Calc DUT(.x(x),.y(y),.zx(zx),.nx(nx),.zy(zy),.ny(ny),.f(f),.no(no),.o(o),.zr(zr),.ng(ng));

    // Initialisation
    initial begin
        x=8'b00000000;
        y=8'b00000000;
        {zx,nx,zy,ny,f,no}=6'b000000;
        clk=1'b1;
    end

    // Defining the clock - 100Mhz
    always #10 clk = ~clk;

    // Testing
    initial begin
        $monitor("x: %b, y: %b, opcode: %b, output: %b, zr: %b, ng: %b",x,y,{zx,nx,zy,ny,f,no},o,zr,ng);
       fd = $fopen("Calc.txt","w+");
       $fmonitor(fd,"x: %b, y: %b, opcode: %b, output: %b, zr: %b, ng: %b",x,y,{zx,nx,zy,ny,f,no},o,zr,ng);
       //0
        #10 {zx,nx,zy,ny,f,no} = 6'b101010;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // 1
        #10 {zx,nx,zy,ny,f,no} = 6'b111111;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // -1
        #10 {zx,nx,zy,ny,f,no} = 6'b111010;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // x
        #10 {zx,nx,zy,ny,f,no} = 6'b001100;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // y
        #10 {zx,nx,zy,ny,f,no} = 6'b110000;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // ~x
        #10 {zx,nx,zy,ny,f,no} = 6'b001101;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // ~y
        #10 {zx,nx,zy,ny,f,no} = 6'b110001;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // -x
        #10 {zx,nx,zy,ny,f,no} = 6'b001111;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // -y
        #10 {zx,nx,zy,ny,f,no} = 6'b110011;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // x+1
        #10 {zx,nx,zy,ny,f,no} = 6'b011111;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // y+1
        #10 {zx,nx,zy,ny,f,no} = 6'b110111;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // x-1
        #10 {zx,nx,zy,ny,f,no} = 6'b001110;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // y-1
        #10 {zx,nx,zy,ny,f,no} = 6'b110010;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // x+y
        #10 {zx,nx,zy,ny,f,no} = 6'b000010;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // x-y
        #10 {zx,nx,zy,ny,f,no} = 6'b010011;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // y-x
        #10 {zx,nx,zy,ny,f,no} = 6'b000111;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // x&y
        #10 {zx,nx,zy,ny,f,no} = 6'b000000;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

        // x|y
        #10 {zx,nx,zy,ny,f,no} = 6'b010101;
            x=8'b11111111; y=8'b11001111;
        #10 x=8'b01110110; y=8'b00101010;
        #10 x=8'b11100111; y=8'b11010101;
        #10 x=8'b11000111; y=8'b11001010;
        #10 x=8'b00011100; y=8'b11110101;
        #10 x=8'b11011011; y=8'b00101011;
        #10 x=8'b11110111; y=8'b11011100;
        #10 x=8'b01010101; y=8'b10011011;
        #10 x=8'b10101010; y=8'b11011010;
        #10 x=8'b11001101; y=8'b11111111;

       $fclose(fd);
         $finish;
    end
endmodule
