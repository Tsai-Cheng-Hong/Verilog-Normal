//------------------------------------------------------//
//- VLSI 2011                                           //
//-                                                     //
//- Lab10c: Verilog Behavior-Level                      //
//------------------------------------------------------//

`timescale 1ns/10ps

`include "CHIP.v"

module TEST;

parameter	CYCLE_TIME = 10;

//input port
reg	CLK;
reg	RESET;
reg	IN_VALID;
reg	[7:0]IN_DATA;

//output port
wire	OUT_VALID;
wire	[3:0]OUT_DATA_X;
wire	[3:0]OUT_DATA_Y;
wire	[15:0]OUT_DATA_SUM;

//pattern reg
reg	[7:0]P_INPUT_DATA[68:0];
reg	[3:0]P_OUTPUT_DATA_X[23:0];
reg	[3:0]P_OUTPUT_DATA_Y[23:0];
reg	[15:0]P_OUTPUT_DATA_SUM[23:0];

wire	[3:0]CORRECT_X;
wire	[3:0]CORRECT_Y;
wire	[15:0]CORRECT_SUM;

//integer counter
integer	in_counter;
integer	error_count;
integer counter_3;
integer	counter_24;
integer	cycle_time;
integer	wait_count;

reg	wait_signal;

assign	CORRECT_X = OUT_VALID ? P_OUTPUT_DATA_X[counter_24] : 0;
assign	CORRECT_Y = OUT_VALID ? P_OUTPUT_DATA_Y[counter_24] : 0;
assign	CORRECT_SUM = OUT_VALID ? P_OUTPUT_DATA_SUM[counter_24] : 0;


reg	DELAY_CLK;
always	DELAY_CLK = #2 CLK;


//CLOCK GEN
initial begin
	CLK = 1'b0;
end
always	#(CYCLE_TIME/2) CLK = ~CLK;

initial begin
	$readmemb("INPUT.vec", P_INPUT_DATA);
	$readmemb("ANS_X.vec", P_OUTPUT_DATA_X);
	$readmemb("ANS_Y.vec", P_OUTPUT_DATA_Y);
	$readmemb("ANS_SUM.vec", P_OUTPUT_DATA_SUM);
	$fsdbDumpfile("CHIP.fsdb");
	$fsdbDumpvars;
end

//input initial
initial begin
	RESET = 1'b0;
	IN_VALID = 1'b0;
	in_counter = 0;
	counter_3 = 0;
	counter_24 = 0;
	cycle_time = 0;
	error_count = 0;
	
	#13
	RESET = 1'b1;
	#13
	RESET = 1'b0;
	
	#11 IN_VALID = 1'b1;
		
	#(CYCLE_TIME*23) IN_VALID = 1'b0;
	
	wait(OUT_VALID);
	
	for(counter_24 = 0;counter_24 < 8; counter_24 = counter_24 + 1)
	begin
		@(posedge CLK)
		begin
			if(P_OUTPUT_DATA_X[counter_24] == OUT_DATA_X && P_OUTPUT_DATA_Y[counter_24] == OUT_DATA_Y && P_OUTPUT_DATA_SUM[counter_24] == OUT_DATA_SUM)
			begin
				$display ();
				$display ("  IN PATTERN 1");
				$display ("  CORRECT ANSWER:");
				$display ("  X   = %d", OUT_DATA_X);
				$display ("  Y   = %d", OUT_DATA_Y);
				$display ("  SUM = %d", OUT_DATA_SUM);
				$display ();
			end
			else
			begin
				$display ();
				$display (" IN PATTERN 1");
				$display (" ERROR SUM IN (%d, %d)", P_OUTPUT_DATA_X[counter_24], P_OUTPUT_DATA_Y[counter_24]);
				$display (" ERROR IN CYCLE: %d ", cycle_time);
				$display ();
				error_count = error_count + 1;
			end
		end
	end
	$display ();
	$display ("/***************************************/");
	$display ();
	wait(~OUT_VALID);
	
	#11 IN_VALID = 1'b1;
		
	#(CYCLE_TIME*23) IN_VALID = 1'b0;
	
	wait(OUT_VALID);
	
	for(counter_24 = 8;counter_24 < 16; counter_24 = counter_24 + 1)
	begin
		@(posedge CLK)
		begin
			if(P_OUTPUT_DATA_X[counter_24] == OUT_DATA_X && P_OUTPUT_DATA_Y[counter_24] == OUT_DATA_Y && P_OUTPUT_DATA_SUM[counter_24] == OUT_DATA_SUM)
			begin
				$display ();
				$display ("  IN PATTERN 2");
				$display ("  CORRECT ANSWER:");
				$display ("  X   = %d", OUT_DATA_X);
				$display ("  Y   = %d", OUT_DATA_Y);
				$display ("  SUM = %d", OUT_DATA_SUM);
				$display ();
			end
			else
			begin
				$display ();
				$display ("  IN PATTERN 2");
				$display ("  ERROR SUM IN (%d, %d)", P_OUTPUT_DATA_X[counter_24], P_OUTPUT_DATA_Y[counter_24]);
				$display ("  ERROR IN CYCLE: %d ", cycle_time);
				$display ();
				error_count = error_count + 1;
			end
		end
	end
	$display ();
	$display ("/***************************************/");
	$display ();
	wait(~OUT_VALID);
	
	#11 IN_VALID = 1'b1;
		
	#(CYCLE_TIME*23) IN_VALID = 1'b0;
	
	wait(OUT_VALID);
	
	for(counter_24 = 16;counter_24 < 24; counter_24 = counter_24 + 1)
	begin
		@(posedge CLK)
		begin
			if(P_OUTPUT_DATA_X[counter_24] == OUT_DATA_X && P_OUTPUT_DATA_Y[counter_24] == OUT_DATA_Y && P_OUTPUT_DATA_SUM[counter_24] == OUT_DATA_SUM)
			begin
				$display ();
				$display (" IN PATTERN 3");
				$display ("  CORRECT ANSWER:");
				$display ("  X   = %d", OUT_DATA_X);
				$display ("  Y   = %d", OUT_DATA_Y);
				$display ("  SUM = %d", OUT_DATA_SUM);
				$display ();
			end
			else
			begin
				$display ();
				$display (" IN PATTERN 3");
				$display (" ERROR SUM IN (%d, %d)", P_OUTPUT_DATA_X[counter_24], P_OUTPUT_DATA_Y[counter_24]);
				$display (" ERROR IN CYCLE: %d ", cycle_time);
				$display ();
				error_count = error_count + 1;
			end
		end
	end
end

always@(posedge CLK or posedge RESET or negedge IN_VALID)
begin
	if(RESET)
	begin
		wait_count <= 0;
	end
	else if(~IN_VALID)
	begin
		wait_count <= wait_count + 1;
	end
	else
		wait_count <= 0;
end

always@(posedge CLK)
begin
	if(wait_count == 50)
	begin
		$display ();
		$display (" AFTER IN_VALID SIGNAL");
		$display (" IN 50 CLOCK CYCLE");
		$display (" NO ANY OUTPUT VALID SIGNAL");
		$display (" ! ! ! !FAIL ! ! ! !");
		$display ();
		#20 $finish;
	end
end

always@(negedge OUT_VALID)
begin	
	if(~OUT_VALID)
	begin
		counter_3 = counter_3 + 1;
	end
end

always@(posedge CLK)
begin
	cycle_time <= cycle_time + 1;
end


always@(counter_3)
begin
	if(counter_3 == 4)
	begin
		if(error_count == 0)
		begin
			$display ();
			$display ("//////////SUCCESS/////////////////");
			$display ("//////////SUCCESS/////////////////");
			$display ("//////////SUCCESS/////////////////");
			$display ();
			#20 $finish;
		end
		else
		begin
			$display ();
			$display ("//////////FAIL/////////////////");
			$display ("//////////FAIL/////////////////");
			$display ("//////////FAIL/////////////////");
			$display (" ERROR NUMBER = %d ", error_count);
			$display ();
			#20 $finish;
		end
	end
end



always@(posedge CLK)
begin
	if(OUT_VALID)
		counter_24 <= counter_24 + 1;
end

always@(posedge DELAY_CLK or posedge RESET or posedge IN_VALID)
begin
	if(RESET)
	begin
		IN_DATA <= 8'd0;
	end
	else if(IN_VALID)
	begin
		IN_DATA <=  P_INPUT_DATA[in_counter];
	end
	else
	begin
		IN_DATA <= 8'd0;
	end
end

always@(posedge CLK)
begin
	if(IN_VALID)
		in_counter = in_counter + 1'b1;
end


CHIP CHIP(
	.CLK(CLK),
	.RESET(RESET),
	.IN_VALID(IN_VALID),
	.IN_DATA(IN_DATA),
	.OUT_VALID(OUT_VALID),
	.OUT_DATA_X(OUT_DATA_X),
	.OUT_DATA_Y(OUT_DATA_Y),
	.OUT_DATA_SUM(OUT_DATA_SUM)
	);

endmodule
