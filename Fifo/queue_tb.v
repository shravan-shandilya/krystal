module queue_tb;
reg put,get,clk,flush;
reg [`INSTR_WIDTH-1:0]d_in;
wire [`INSTR_WIDTH-1:0]d_out;
wire empty,full;


initial
begin
`include "attributes.v"
$monitor("flush=%b,put=%b,d_in=%b,get=%b,d_out=%b,empty=%b,full=%b",flush,put,d_in,get,d_out,empty,full);
flush = 1'b1;
d_in = 12'd1024;
put = 1'b1;
d_in = 12'd2013;
end

always begin
#5 clk <= !clk;
d_in <= d_in + 12'd1;
put <= 1'b1;
#2 put <= 1'b0;
put <= 1'b1;
#2 put <= 1'b0;
get <= 1'b1;
#2 get <= 1'b0;
if (d_in == 12'd10)
$finish;
end
queue q(
.put (put),
.get (get),
.clk (clk),
.flush (flush),
.d_in (d_in),
.d_out (d_out),
.empty (empty),
.full (full)
);
endmodule
