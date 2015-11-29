module queue(
input put,get,clk,flush,
input [`INSTR_WIDTH-1:0]d_in,
output reg [`INSTR_WIDTH-1:0]d_out,
output reg empty,full
);

reg [`INSTR_WIDTH-1:0] buffer [`QUEUE_DEPTH-1:0];
reg [`QUEUE_POINTER_WIDTH:0]GET_POINTER;
reg i;
initial begin
`include "attributes.v"
end

always @ (flush)
if (flush)
begin
GET_POINTER <= 3'b000;
empty <= 1'b1;
full <= 1'b0;
end


always @ (posedge put or posedge clk)
if (GET_POINTER < 3'b111)
begin
buffer[0] <= d_in;
$display("Put");
for(i=3'd1;i<`QUEUE_DEPTH;i=i+3'd1)
buffer[i] <= buffer[i-3'd1];
GET_POINTER <= GET_POINTER + 3'd1;
empty <= 1'b0;
full <= 1'b0;
end
else
begin
$display("Buffer full");
full = 1'b1;
end

always @ (posedge get)
begin
d_out <= (GET_POINTER >=0)?buffer[GET_POINTER]:12'd0;
GET_POINTER <= (GET_POINTER >0)? GET_POINTER-1:GET_POINTER;
end

endmodule
