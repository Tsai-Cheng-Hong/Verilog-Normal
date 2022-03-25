//------------------------------------------------------//
//- VLSI 2011                                           //
//-                                                     //
//- Lab10c: Verilog Behavior-Level                      //
//------------------------------------------------------//

module  CHIP(
    CLK,
    RESET,
    IN_VALID,
    IN_DATA,
    OUT_VALID,
    OUT_DATA_X,
    OUT_DATA_Y,
    OUT_DATA_SUM
    );

//input port
input   CLK;
input   RESET;
input   IN_VALID;
input   [7:0]IN_DATA;

//output port
output  OUT_VALID;
output  [3:0]OUT_DATA_X;
output  [3:0]OUT_DATA_Y;
output  [15:0]OUT_DATA_SUM;

/////////////////////////////////
//design your code there/////////
/////////////////////////////////
reg OUT_VALID;
reg [5:0] count;
reg [6:0] a0_0,a1_0,a2_0,a3_0,a4_0,
	  a0_1,a1_1,a2_1,a3_1,a4_1,
	  a0_2,a1_2,a2_2,a3_2,a4_2,
	  a0_3,a1_3,a2_3,a3_3,a4_3,
	  a0_4,a1_4,a2_4,a3_4,a4_4;
reg [2:0] x1,x2,x3,x4,x5,x6,x7,x8,y1,y2,y3,y4,y5,y6,y7,y8;
reg [7:0] num1,num2,num3,num4,num5,num6,num7,num8;
reg  [3:0]OUT_DATA_X;
reg  [3:0]OUT_DATA_Y;
reg  [15:0]OUT_DATA_SUM;

always@(posedge CLK)
begin
	if (RESET)
	begin
	OUT_DATA_X <= 0;
	OUT_DATA_Y <= 0;
	OUT_DATA_SUM <= 0;
	end
	else if (count == 25)
	begin
	OUT_DATA_X <= x1;
	OUT_DATA_Y <= y1;
	OUT_DATA_SUM <= num1;
	end
	else if (count == 26)
	begin
	OUT_DATA_X <= x2;
	OUT_DATA_Y <= y2;
	OUT_DATA_SUM <= OUT_DATA_SUM + num2;
	end
	else if (count == 27)
	begin
	OUT_DATA_X <= x3;
	OUT_DATA_Y <= y3;
	OUT_DATA_SUM <= OUT_DATA_SUM + num3;
	end
	else if (count == 28)
	begin
	OUT_DATA_X <= x4;
	OUT_DATA_Y <= y4;
	OUT_DATA_SUM <= OUT_DATA_SUM + num4;
	end
	else if (count == 29)
	begin
	OUT_DATA_X <= x5;
	OUT_DATA_Y <= y5;
	OUT_DATA_SUM <= OUT_DATA_SUM + num5;
	end
	else if (count == 30)
	begin
	OUT_DATA_X <= x6;
	OUT_DATA_Y <= y6;
	OUT_DATA_SUM <= OUT_DATA_SUM + num6;
	end
	else if (count == 31)
	begin
	OUT_DATA_X <= x7;
	OUT_DATA_Y <= y7;
	OUT_DATA_SUM <= OUT_DATA_SUM + num7;
	end
	else if (count == 32)
	begin
	OUT_DATA_X <= x8;
	OUT_DATA_Y <= y8;
	OUT_DATA_SUM <= OUT_DATA_SUM + num8;
	end

end

always@(posedge CLK)
begin
	if (RESET)
	begin
	a0_0 <= 0; 
	a1_0 <= 0;
	a2_0 <= 0;
	a3_0 <= 0;
	a4_0 <= 0;
	a0_1 <= 0;
	a1_1 <= 0;
	a2_1 <= 0;
	a3_1 <= 0;
	a4_1 <= 0;
	a0_2 <= 0;
	a1_2 <= 0;
	a2_2 <= 0;
	a3_2 <= 0;
	a4_2 <= 0;
	a0_3 <= 0;
	a1_3 <= 0;
	a2_3 <= 0;
	a3_3 <= 0;
	a4_3 <= 0;
	a0_4 <= 0;
	a1_4 <= 0;
	a2_4 <= 0;
	a3_4 <= 0;
	a4_4 <= 0;
	end
	else if (count == 0)
	a0_0 <= IN_DATA;
	else if (count == 1)
	a1_0 <= IN_DATA;
	else if (count == 2)
	a2_0 <= IN_DATA;
	else if (count == 3)
	a3_0 <= IN_DATA;
	else if (count == 4)
	a4_0 <= IN_DATA;
	else if (count == 5)
	a0_1 <= IN_DATA;
	else if (count == 6)
	a1_1 <= IN_DATA;
	else if (count == 7)
	a2_1 <= IN_DATA;
	else if (count == 8)
	a3_1 <= IN_DATA;
	else if (count == 9)
	a4_1 <= IN_DATA;
	else if (count == 10)
	a0_2 <= IN_DATA;
	else if (count == 11)
	a1_2 <= IN_DATA;
	else if (count == 12)
	a2_2 <= IN_DATA;
	else if (count == 13)
	a3_2 <= IN_DATA;
	else if (count == 14)
	a4_2 <= IN_DATA;
	else if (count == 15)
	a0_3 <= IN_DATA;
	else if (count == 16)
	a1_3 <= IN_DATA;
	else if (count == 17)
	a2_3 <= IN_DATA;
	else if (count == 18)
	a3_3 <= IN_DATA;
	else if (count == 19)
	a4_3 <= IN_DATA;
	else if (count == 20)
	a0_4 <= IN_DATA;
	else if (count == 21)
	a1_4 <= IN_DATA;
	else if (count == 22)
	a2_4 <= IN_DATA;
	else if (count == 23)
	a3_4 <= IN_DATA;
	else if (count == 24)
	a4_4 <= IN_DATA;
end




always@(posedge CLK)
begin
	if (RESET)
	count <= 0;
	else if (count == 33)
	count <= 0;
	else
	count <= count +1;
end

always@(posedge CLK)
begin
	if (RESET)
	OUT_VALID <= 1'b0;
	else if (count >= 25 && count <= 32)
	OUT_VALID <= 1'b1;
	else
	OUT_VALID <= 1'b0;
end

always@(posedge CLK)
begin
	if (RESET)
		begin
		x1 <= 0;
		x2 <= 0;
		x3 <= 0;
		x4 <= 0;
		x5 <= 0;
		x6 <= 0;
		x7 <= 0;
		x8 <= 0;
		y1 <= 0;
		y2 <= 0;
		y3 <= 0;
		y4 <= 0;
		y5 <= 0;
		y6 <= 0;
		y7 <= 0;
		y8 <= 0;
		num1 <= 0;
		num2 <= 0;
		num3 <= 0;
		num4 <= 0;
		num5 <= 0;
		num6 <= 0;
		num7 <= 0;
		num8 <= 0;
		end
	else if ( (a1_0 < a0_1) && (a2_0 < a1_1) && (a3_0 < a2_1) && (a4_0 < a3_1) )
		begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 2;
		y2 <= 0;
		num2 <= a2_0;
		x3 <= 3;
		y3 <= 0;
		num3 <= a3_0;
		x4 <= 4;
		y4 <= 0;
		num4 <= a4_0;
		x5 <= 4;
		y5 <= 1;
		num5 <= a4_1;
		x6 <= 4;
		y6 <= 2;
		num6 <= a4_2;
		x7 <= 4;
		y7 <= 3;
		num7 <= a4_3;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
		end
	else if ( (a1_0 < a0_1) && (a2_0 < a1_1) && (a3_0 < a2_1) && (a3_1 < a4_0) && (a4_1 < a3_2) )
		begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 2;
		y2 <= 0;
		num2 <= a2_0;
		x3 <= 3;
		y3 <= 0;
		num3 <= a3_0;
		x4 <= 3;
		y4 <= 1;
		num4 <= a3_1;
		x5 <= 4;
		y5 <= 1;
		num5 <= a4_1;
		x6 <= 4;
		y6 <= 2;
		num6 <= a4_2;
		x7 <= 4;
		y7 <= 3;
		num7 <= a4_3;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
		end
	else if ( (a1_0 < a0_1) && (a2_0 < a1_1) && (a3_0 < a2_1) && (a3_1 < a4_0) && (a3_2 < a4_1) && (a4_2 < a3_3) )
		begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 2;
		y2 <= 0;
		num2 <= a2_0;
		x3 <= 3;
		y3 <= 0;
		num3 <= a3_0;
		x4 <= 3;
		y4 <= 1;
		num4 <= a3_1;
		x5 <= 3;
		y5 <= 2;
		num5 <= a3_2;
		x6 <= 4;
		y6 <= 2;
		num6 <= a4_2;
		x7 <= 4;
		y7 <= 3;
		num7 <= a4_3;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
		end
	else if ( (a1_0 < a0_1) && (a2_0 < a1_1) && (a3_0 < a2_1) && (a3_1 < a4_0) && (a3_2 < a4_1) && (a3_3 < a4_2) && (a4_3 < a3_4) )
		begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 2;
		y2 <= 0;
		num2 <= a2_0;
		x3 <= 3;
		y3 <= 0;
		num3 <= a3_0;
		x4 <= 3;
		y4 <= 1;
		num4 <= a3_1;
		x5 <= 3;
		y5 <= 2;
		num5 <= a3_2;
		x6 <= 3;
		y6 <= 3;
		num6 <= a3_3;
		x7 <= 4;
		y7 <= 3;
		num7 <= a4_3;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
		end
	else if ( (a1_0 < a0_1) && (a2_0 < a1_1) && (a3_0 < a2_1) && (a3_1 < a4_0) && (a3_2 < a4_1) && (a3_3 < a4_2) && (a3_4 < a4_3) )
		begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 2;
		y2 <= 0;
		num2 <= a2_0;
		x3 <= 3;
		y3 <= 0;
		num3 <= a3_0;
		x4 <= 3;
		y4 <= 1;
		num4 <= a3_1;
		x5 <= 3;
		y5 <= 2;
		num5 <= a3_2;
		x6 <= 3;
		y6 <= 3;
		num6 <= a3_3;
		x7 <= 3;
		y7 <= 4;
		num7 <= a3_4;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
		end	
	else if ( (a1_0 < a0_1) && (a2_0 < a1_1) && (a2_1 < a3_0) && (a3_1 < a2_2) && (a4_1 < a3_2))
		begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 2;
		y2 <= 0;
		num2 <= a2_0;
		x3 <= 2;
		y3 <= 1;
		num3 <= a2_1;
		x4 <= 3;
		y4 <= 1;
		num4 <= a3_1;
		x5 <= 4;
		y5 <= 1;
		num5 <= a4_1;
		x6 <= 4;
		y6 <= 2;
		num6 <= a4_2;
		x7 <= 4;
		y7 <= 3;
		num7 <= a4_3;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
		end	
	else if ( (a1_0 < a0_1) && (a2_0 < a1_1) && (a2_1 < a3_0) && (a3_1 < a2_2) && (a3_2 < a4_1) && (a4_2 < a3_3))
		begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 2;
		y2 <= 0;
		num2 <= a2_0;
		x3 <= 2;
		y3 <= 1;
		num3 <= a2_1;
		x4 <= 3;
		y4 <= 1;
		num4 <= a3_1;
		x5 <= 3;
		y5 <= 2;
		num5 <= a3_2;
		x6 <= 4;
		y6 <= 2;
		num6 <= a4_2;
		x7 <= 4;
		y7 <= 3;
		num7 <= a4_3;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
		end	
	else if ( (a1_0 < a0_1) && (a2_0 < a1_1) && (a2_1 < a3_0) && (a3_1 < a2_2) && (a3_2 < a4_1) && (a3_3 < a4_2) && (a4_3 < a3_4))
		begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 2;
		y2 <= 0;
		num2 <= a2_0;
		x3 <= 2;
		y3 <= 1;
		num3 <= a2_1;
		x4 <= 3;
		y4 <= 1;
		num4 <= a3_1;
		x5 <= 3;
		y5 <= 2;
		num5 <= a3_2;
		x6 <= 3;
		y6 <= 3;
		num6 <= a3_3;
		x7 <= 4;
		y7 <= 3;
		num7 <= a4_3;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
		end	
	else if ( (a1_0 < a0_1) && (a2_0 < a1_1) && (a2_1 < a3_0) && (a3_1 < a2_2) && (a3_2 < a4_1) && (a3_3 < a4_2) && (a3_4 < a4_3))
		begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 2;
		y2 <= 0;
		num2 <= a2_0;
		x3 <= 2;
		y3 <= 1;
		num3 <= a2_1;
		x4 <= 3;
		y4 <= 1;
		num4 <= a3_1;
		x5 <= 3;
		y5 <= 2;
		num5 <= a3_2;
		x6 <= 3;
		y6 <= 3;
		num6 <= a3_3;
		x7 <= 3;
		y7 <= 4;
		num7 <= a3_4;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
		end	
	else if ( (a1_0 < a0_1) && (a2_0 < a1_1) && (a2_1 < a3_0) && (a2_2 < a3_1))  //(2,2)
		begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 2;
		y2 <= 0;
		num2 <= a2_0;
		x3 <= 2;
		y3 <= 1;
		num3 <= a2_1;
		x4 <= 2;
		y4 <= 2;
		num4 <= a2_2;
			if ((a2_3 < a3_2) && (a2_4 < a3_3)) //1
			begin		
			x5 <= 2;
			y5 <= 3;
			num5 <= a2_3;
			x6 <= 2;
			y6 <= 4;
			num6 <= a2_4;
			x7 <= 3;
			y7 <= 4;
			num7 <= a3_4;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a2_3 < a3_2) && (a3_3 < a2_4) && (a3_4 < a4_3)) //2
			begin		
			x5 <= 2;
			y5 <= 3;
			num5 <= a2_3;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 3;
			y7 <= 4;
			num7 <= a3_4;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a2_3 < a3_2) && (a3_3 < a2_4) && (a4_3 < a3_4)) //3
			begin		
			x5 <= 2;
			y5 <= 3;
			num5 <= a2_3;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 4;
			y7 <= 3;
			num7 <= a4_3;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a3_2 < a2_3) && (a4_2 < a3_3)) //4
			begin
			x5 <= 3;
			y5 <= 2;
			num5 <= a3_2;
			x6 <= 4;
			y6 <= 2;
			num6 <= a4_2;
			x7 <= 4;
			y7 <= 3;
			num7 <= a4_3;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a3_2 < a2_3) && (a3_3 < a4_2) && (a3_4 < a4_3)) //5
			begin
			x5 <= 3;
			y5 <= 2;
			num5 <= a3_2;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 3;
			y7 <= 4;
			num7 <= a3_4;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else //((a3_2 < a2_3) && (a3_3 < a4_2) && (a3_4 < a4_3)) //6
			begin
			x5 <= 3;
			y5 <= 2;
			num5 <= a3_2;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 4;
			y7 <= 3;
			num7 <= a4_3;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
		end
	else if ( (a1_0 < a0_1) && (a1_1 < a2_0) && (a1_2 < a2_1) && (a1_3 < a2_2) && (a1_4 < a2_3) )
	begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 1;
		y2 <= 1;
		num2 <= a1_1;
		x3 <= 1;
		y3 <= 2;
		num3 <= a1_2;
		x4 <= 1;
		y4 <= 3;
		num4 <= a1_3;
		x5 <= 1;
		y5 <= 4;
		num5 <= a1_4;
		x6 <= 2;
		y6 <= 4;
		num6 <= a2_4;
		x7 <= 3;
		y7 <= 4;
		num7 <= a3_4;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
	end
	else if ( (a1_0 < a0_1) && (a1_1 < a2_0) && (a1_2 < a2_1) && (a1_3 < a2_2) && (a2_3 < a1_4) && (a2_4 < a3_3))
	begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 1;
		y2 <= 1;
		num2 <= a1_1;
		x3 <= 1;
		y3 <= 2;
		num3 <= a1_2;
		x4 <= 1;
		y4 <= 3;
		num4 <= a1_3;
		x5 <= 2;
		y5 <= 3;
		num5 <= a2_3;
		x6 <= 2;
		y6 <= 4;
		num6 <= a2_4;
		x7 <= 3;
		y7 <= 4;
		num7 <= a3_4;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
	end
	else if ( (a1_0 < a0_1) && (a1_1 < a2_0) && (a1_2 < a2_1) && (a1_3 < a2_2) && (a2_3 < a1_4) && (a3_3 < a2_4) && (a3_4 < a4_3))
	begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 1;
		y2 <= 1;
		num2 <= a1_1;
		x3 <= 1;
		y3 <= 2;
		num3 <= a1_2;
		x4 <= 1;
		y4 <= 3;
		num4 <= a1_3;
		x5 <= 2;
		y5 <= 3;
		num5 <= a2_3;
		x6 <= 3;
		y6 <= 3;
		num6 <= a3_3;
		x7 <= 3;
		y7 <= 4;
		num7 <= a3_4;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
	end		
	else if ( (a1_0 < a0_1) && (a1_1 < a2_0) && (a1_2 < a2_1) && (a1_3 < a2_2) && (a2_3 < a1_4) && (a3_3 < a2_4) && (a4_3 < a3_4))
	begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 1;
		y2 <= 1;
		num2 <= a1_1;
		x3 <= 1;
		y3 <= 2;
		num3 <= a1_2;
		x4 <= 1;
		y4 <= 3;
		num4 <= a1_3;
		x5 <= 2;
		y5 <= 3;
		num5 <= a2_3;
		x6 <= 3;
		y6 <= 3;
		num6 <= a3_3;
		x7 <= 4;
		y7 <= 3;
		num7 <= a4_3;
		x8 <= 4;
		y8 <= 4;
		num8 <= a4_4;
	end		
	else if ( (a1_0 < a0_1) && (a1_1 < a2_0) && (a1_2 < a2_1) && (a2_2 < a1_3))
	begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 1;
		y2 <= 1;
		num2 <= a1_1;
		x3 <= 1;
		y3 <= 2;
		num3 <= a1_2;
		x4 <= 2;
		y4 <= 2;
		num4 <= a2_2;
			if ((a2_3 < a3_2) && (a2_4 < a3_3)) //1
			begin		
			x5 <= 2;
			y5 <= 3;
			num5 <= a2_3;
			x6 <= 2;
			y6 <= 4;
			num6 <= a2_4;
			x7 <= 3;
			y7 <= 4;
			num7 <= a3_4;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a2_3 < a3_2) && (a3_3 < a2_4) && (a3_4 < a4_3)) //2
			begin		
			x5 <= 2;
			y5 <= 3;
			num5 <= a2_3;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 3;
			y7 <= 4;
			num7 <= a3_4;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a2_3 < a3_2) && (a3_3 < a2_4) && (a4_3 < a3_4)) //3
			begin		
			x5 <= 2;
			y5 <= 3;
			num5 <= a2_3;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 4;
			y7 <= 3;
			num7 <= a4_3;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a3_2 < a2_3) && (a4_2 < a3_3)) //4
			begin
			x5 <= 3;
			y5 <= 2;
			num5 <= a3_2;
			x6 <= 4;
			y6 <= 2;
			num6 <= a4_2;
			x7 <= 4;
			y7 <= 3;
			num7 <= a4_3;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a3_2 < a2_3) && (a3_3 < a4_2) && (a3_4 < a4_3)) //5
			begin
			x5 <= 3;
			y5 <= 2;
			num5 <= a3_2;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 3;
			y7 <= 4;
			num7 <= a3_4;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else //((a3_2 < a2_3) && (a3_3 < a4_2) && (a3_4 < a4_3)) //6
			begin
			x5 <= 3;
			y5 <= 2;
			num5 <= a3_2;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 4;
			y7 <= 3;
			num7 <= a4_3;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
	end

	else if ( (a1_0 < a0_1) && (a1_1 < a2_0) && (a2_1 < a1_2) && (a2_2 < a3_1))
		begin
		x1 <= 1;
		y1 <= 0;
		num1 <= a1_0;
		x2 <= 1;
		y2 <= 1;
		num2 <= a1_1;
		x3 <= 2;
		y3 <= 1;
		num3 <= a2_1;
		x4 <= 2;
		y4 <= 2;
		num4 <= a2_2;
			if ((a2_3 < a3_2) && (a2_4 < a3_3)) //1
			begin		
			x5 <= 2;
			y5 <= 3;
			num5 <= a2_3;
			x6 <= 2;
			y6 <= 4;
			num6 <= a2_4;
			x7 <= 3;
			y7 <= 4;
			num7 <= a3_4;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a2_3 < a3_2) && (a3_3 < a2_4) && (a3_4 < a4_3)) //2
			begin		
			x5 <= 2;
			y5 <= 3;
			num5 <= a2_3;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 3;
			y7 <= 4;
			num7 <= a3_4;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a2_3 < a3_2) && (a3_3 < a2_4) && (a4_3 < a3_4)) //3
			begin		
			x5 <= 2;
			y5 <= 3;
			num5 <= a2_3;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 4;
			y7 <= 3;
			num7 <= a4_3;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a3_2 < a2_3) && (a4_2 < a3_3)) //4
			begin
			x5 <= 3;
			y5 <= 2;
			num5 <= a3_2;
			x6 <= 4;
			y6 <= 2;
			num6 <= a4_2;
			x7 <= 4;
			y7 <= 3;
			num7 <= a4_3;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else if ((a3_2 < a2_3) && (a3_3 < a4_2) && (a3_4 < a4_3)) //5
			begin
			x5 <= 3;
			y5 <= 2;
			num5 <= a3_2;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 3;
			y7 <= 4;
			num7 <= a3_4;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
			else //((a3_2 < a2_3) && (a3_3 < a4_2) && (a3_4 < a4_3)) //6
			begin
			x5 <= 3;
			y5 <= 2;
			num5 <= a3_2;
			x6 <= 3;
			y6 <= 3;
			num6 <= a3_3;
			x7 <= 4;
			y7 <= 3;
			num7 <= a4_3;
			x8 <= 4;
			y8 <= 4;
			num8 <= a4_4;
			end
	end

end








	
endmodule
