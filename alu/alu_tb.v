module alu_tb;
reg clock,reset;
reg [3:0]b,c;
wire [3:0]al,ah;
reg [2:0]opcode;

initial
begin
opcode = 3'b000;
reset = 1'b0;
clock = 1'b0;
b = 4'd0;
c = 4'd0;
$monitor ("%d\t%d\top=%b,b=%b,c=%b,ah=%b,al=%b",$time,clock,opcode,b,c,ah,al);
$dumpfile("plot.vcd");
#10 b = 4'd10;
#10 c = 4'd2;
#20 opcode = 3'b001;
#20 opcode = 3'b010;
#20 opcode = 3'b011;
#20 opcode = 3'b100;
#20 opcode = 3'b101;
#20 opcode = 3'b110;
#20 opcode = 3'b111;
$finish;
end

always begin 
#5 clock = !clock;
end


alu a(
.clock (clock),
.opcode (opcode),
.b (b),
.c (c),
.reset (reset),
.al (al),
.ah (ah)
);
endmodule
