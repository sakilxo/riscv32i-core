TOP = alu

RTL = $(TOP).sv
TB  = $(TOP)_tb.sv

build:
	verilator --binary --trace $(RTL) $(TB)

run: build
	./obj_dir/V$(TOP)

wave: run
	surfer $(TOP).vcd

clean:
	rm -rf obj_dir *.vcd *.log

all: run