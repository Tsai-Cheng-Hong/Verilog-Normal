`timescale 1ns/10ps
`include "SQRT_syn.v"
`include "/usr/chipware/CW_sqrt.v"

`define CLOCK 10
`define HALF_CLK (`CLOCK/2)
`define ITER_COUNT 100

module TEST;
reg RST;
reg CLK;
reg IN_VALID;
reg [15:0] IN;
wire OUT_VALID;
wire [11:0] OUT;
wire [12:0] ROOT;
wire [11:0] CORRECT_ANS;

integer i, j;
integer error_count, correct_count;

SQRT sqrt1(.RST(RST), .CLK(CLK), .IN_VALID(IN_VALID), .IN(IN), .OUT_VALID(OUT_VALID), .OUT(OUT));
CW_sqrt #(26, 0) U1({IN, 10'b0}, ROOT);

assign CORRECT_ANS = ROOT[12:1] + ROOT[0];

//---------------------------------------------------------------------
// DUMP WAVEFORM
//---------------------------------------------------------------------

initial begin
   $fsdbDumpfile("SQRT_gate.fsdb");
   $fsdbDumpvars;
   $sdf_annotate("SQRT.sdf", sqrt1);
end

initial begin
	RST = 1;
	CLK = 1;
	IN = 0;
	IN_VALID = 0;
	error_count = 0;
	correct_count = 0;
	#(`HALF_CLK *3) RST = 1'b0;

	for(i=0; i<`ITER_COUNT; i=i+1) begin
		#(`CLOCK) IN = $random % 65501;	
		IN_VALID = 1;
		#(`CLOCK) IN_VALID = 0;
		
		for(j=0; j<20; j=j+1) begin
			@(negedge CLK);
			if(OUT_VALID) begin
				if(OUT === CORRECT_ANS) begin
					correct_count = correct_count +1;
				end
				else begin
					$display("%d-th, failed!", i);
					$display("IN = %d, OUT = %d.%0d, ANSWER = %d.%0d\n", 
						IN, OUT[11:4], OUT[3:0]*10000/16, CORRECT_ANS[11:4], CORRECT_ANS[3:0]*10000/16);
					error_count = error_count +1;
				end
			end
		end
	end

	$display();
	if(correct_count == 0 && error_count == 0)begin
		$display("///////////////////////////////");
		$display("// out_valid DOESN'T ASSERT! //");
		$display("///////////////////////////////");
	end		
	if(error_count != 0) begin
		$display("////////////////");
		$display("//  FAILED!   //");
		$display("////////////////");
	end
	if(correct_count == `ITER_COUNT) begin
		$display("///////////////////");
		$display("//  SUCCESSFUL!  //");
		$display("///////////////////");
	end
	$display();
	
	#10 $finish;
end


always #`HALF_CLK CLK = ~CLK;



endmodule
