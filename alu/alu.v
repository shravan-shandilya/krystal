module alu(clock,opcode,b,c,al,ah,reset);
input wire clock,reset;
input wire [2:0]opcode;
input wire [3:0]b,c;
output reg [3:0]al,ah;
always @ (posedge clock or posedge reset)
if (reset)
	begin
	{ah,al}<=8'b00000000;
	end
else
	case(opcode)
	3'b000:{ah,al}<=b+c;
	3'b001:{ah,al}<=b-c;
	3'b010:{ah,al}<=b*c;
	3'b011:{ah,al}<=b<<c;
	3'b100:{ah,al}<=b&c;
	3'b101:{ah,al}<=b|c;
	3'b110:{ah,al}<=b^c;
	default:{ah,al}<=8'd0;
	endcase
endmodule

