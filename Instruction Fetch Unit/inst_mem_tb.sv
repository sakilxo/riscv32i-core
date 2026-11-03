module stimulus ();
    reg [31:0] PC;
    reg RESET;
    wire [31:0] INST_CODE;

    // instantiating instruction memory
    INST_MEM INST_MEM_module(PC, RESET, INST_CODE);

    // setting up waveforms
    initial 
    begin
        $dumpfile("INST_MEM_output_wave.vcd");
        $dumpvars(0,stimulus);
    end

    initial
    $monitor($time, " Instruction code = %h, PC = %d", INST_CODE, PC);

    // setting test conditions
    initial
    begin
        RESET = 1'b0;
        #20 RESET = 1'b1;
        #20 PC = 32'd0;
        #20 PC = 32'd4;
        #20 PC = 32'd8;
        #20 PC = 32'd12;
    end

    // terminating after 150 clock cycles
    initial
    #150 $finish;

endmodule