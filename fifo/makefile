compile:*.v
	iverilog -oqueue_tb *.v
queue_tb:compile

run:queue_tb
	vvp queue_tb
clean:
	rm -rf queue_tb
