//------------------------------------------------------//
//- VLSI 2012                                           //
//-                                                     //
//- Exercise: Design a square root circuit              //
//------------------------------------------------------//
// Square Root

module SQRT(
	RST,
	CLK,
	IN_VALID,
	IN,
	OUT_VALID,
	OUT
);
input CLK;
input RST;
input [15:0] IN;
input IN_VALID;
output reg [11:0] OUT;
output reg OUT_VALID;

// Write your synthesizable code here

reg [12:0]out_data,compare_out,final_out;
reg [27:0]diff;
reg [3:0]count;
reg [4:0]count_cycle;
reg cnt_start;

wire [25:0]data;
wire [3:0]count_f;
assign data = {IN,10'b0};


//CNT is a flag of square root circuit operation 
always @(posedge CLK) begin
	if (RST)
		cnt_start <= 0;
	else if (IN_VALID)
		cnt_start <= 1;
	else if (count == 15)
		cnt_start <= 0;
	else
		cnt_start <= cnt_start;
end

//count a cycle include in_valid & out_valid
always @(posedge CLK) begin
	if (RST)
		count_cycle <= 0;
	else if (IN_VALID)
		count_cycle <= 0;
	else
		count_cycle <= count_cycle + 1;
end

//count is a down-count for square
always @(posedge CLK) begin
	if (RST)
		count <= 12;
	else if (IN_VALID)
		count <= 12;
	else if (cnt_start) begin
		count <= count - 1;
	end
	else
		count <= 15;
end

//computing the square
always @(posedge CLK) begin
	if (RST) begin
		out_data <= 0;
	end
	else if (cnt_start)begin
		if (out_data*out_data < data) //if out_data isn't over then plus 1
			out_data[count] <= 1'b1;
		else begin
			out_data[count_f] <= 1'b0;//else out_data over the the pre-bit -1
			out_data[count] <= 1'b1;  //and this bit plus1
		end
	end
	else if (IN_VALID) begin
		out_data <= 0;
	end
	else begin
		out_data <= out_data;
	end
end
// for pre bit -1
assign count_f = count + 1;

always @(posedge CLK) begin
	if (RST) begin
		final_out <= 0;
	end
	else if (cnt_start) begin//chooose the smallest
		if ((final_out*final_out-data) < (out_data*out_data - data))
			final_out <= final_out;
		else begin
			final_out <= out_data;
		end
	end
	else if (IN_VALID) begin
		final_out <= 0;
	end
	else begin
		final_out <= final_out;
	end
		
end

always @(posedge CLK) begin
	if (RST)
		OUT_VALID <= 0;
	else if (count_cycle == 16)
		OUT_VALID <= 1;
	else
		OUT_VALID <= 0;
		
end

always @(posedge CLK) begin
	if (RST)
		OUT <= 0;
	else if (~IN_VALID)
		OUT <= final_out[12:1];
	else
		OUT <= 0;
end






endmodule

