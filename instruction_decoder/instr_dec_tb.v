module instr_dec_tb;
reg triggered,check_busy;
wire trigger,indicate_busy;
wire [`REG_WIDTH-1:0]b,c;
wire [`OP_WIDTH-1:0]opcode;
reg [`INSTR_WIDTH-1:0]instr;
initial
begin
`include "attributes.v"
instr = 12'd0;
$monitor ("%d\ttriggered=%b,busy=%b,chkbsy=%b,trigger=%b",$time,triggered,indicate_busy,check_busy,trigger);
$dumpfile("plot.vcd");
instr = 12'd2048;
#5 triggered = 1'b1;
#5 check_busy = 1'b1;
#5 check_busy = 1'b0;
#5 instr = 12'd1656;
#5 check_busy = 1'b1;
#5 triggered = 1'b1;
$finish;
end

always begin 
#5 instr = instr + 12'd1;
if (instr == 12'd1024)
$finish;
end

instr_dec dec(
.instr (instr),
.triggered (triggered),
.opcode (opcode),
.b (b),
.c (c),
.trigger (trigger),
.indicate_busy (indicate_busy),
.check_busy (check_busy)
);
endmodule
