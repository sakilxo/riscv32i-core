TOP = stimulus

build:
	verilator --binary --trace --top-module $(TOP) ifu.sv ifu_tb.sv

wave: build
	./obj_dir/V$(TOP)
	surfer waveform.vcd