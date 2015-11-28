module memory_tb;
reg rwbar;
reg [`ADDR_WIDTH-1:0]addr;
reg [`INSTR_WIDTH-1:0]d_in;
wire [`INSTR_WIDTH-1:0]d_out;

initial
begin
`include "attributes.v"
addr = 8'b00000000;
rwbar = 1'b1;
$monitor ("%d\t%d\tr!w=%b,d_out=%b,d_in=%b",$time,addr,rwbar,d_out,d_in);
$dumpfile("plot.vcd");
end

always begin
#5 addr = addr +1;
if (addr == 8'd255)
$finish;
end

memory mem(
.addr (addr),
.d_in (d_in),
.rwbar (rwbar),
.d_out (d_out)
);
endmodule
