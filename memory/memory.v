module memory(
input [`ADDR_WIDTH-1:0]addr,
input [`INSTR_WIDTH-1:0]d_in,
input rwbar,
output reg [`INSTR_WIDTH-1:0]d_out
);
reg [`INSTR_WIDTH-1:0] binary [0:`MEM_SIZE-1];
initial begin
`include "attributes.v"
$readmemh("binary.hex",binary);
end

always @ (rwbar)
if (rwbar)
d_out = binary[addr];
else
binary[addr] = d_in;

always @ (addr)
if (rwbar)
d_out = binary[addr];
else
binary[addr] = d_in;

endmodule
