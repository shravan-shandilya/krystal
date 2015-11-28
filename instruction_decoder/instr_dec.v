module instr_dec(
input [`INSTR_WIDTH-1:0] instr,
input triggered,check_busy,
output reg trigger,indicate_busy,
output reg [`REG_WIDTH-1:0]b,c,
output reg [`OP_WIDTH-1:0]opcode
);

initial begin
`include "attributes.v"
end

always @ (triggered)
begin
if (triggered)
begin
indicate_busy = 1'b1;
{opcode,b,c} = instr;
end
else
$display("Waiting");
end

always @ (check_busy)
if (check_busy)
trigger = 1'b0;
else
begin
trigger = 1'b1;
indicate_busy = 1'b0;
end
endmodule
