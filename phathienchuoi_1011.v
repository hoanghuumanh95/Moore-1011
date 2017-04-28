module phathienchuoi_1011(
a,clk,rst_n,y
);

input a,clk,rst_n;
output reg y;

localparam s0   = 3'b000;
localparam s1   = 3'b001;
localparam s10  = 3'b010;
localparam s101 = 3'b101;
localparam s1011= 3'b111;

reg [2:0] state, nextstate;

always @(a, state)
begin 
  case(state)
   s0: begin
			if(a) nextstate = s1;
			else nextstate = s0;
			y = 0; end
	s1: begin
			if(a) nextstate = s1;
			else nextstate = s10;
			y = 0; end
	s10: begin
			if(a) nextstate = s101;
			else nextstate = s0;
			y = 0; end
	s101: begin
			if(a) nextstate = s10;
			else nextstate = s1011;
			y = 0; end
	s1011: begin
			if(a) nextstate = s1;
			else nextstate = s10;  
			y = 1; end
	endcase
end

always@(posedge clk or negedge rst_n)

begin
	if(!rst_n)
			state <= s0;
	else
			state <= nextstate;
end
			
	

endmodule	