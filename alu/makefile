compile:*.v
	iverilog -o tb *.v
run:tb
	vvp tb
clean:
	rm -rf tb plot.vcd
plot:plot.vcd
	gtkwave plot.vcd &
