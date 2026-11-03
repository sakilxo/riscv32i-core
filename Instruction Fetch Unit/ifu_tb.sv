module stimulus (

);

    reg CLOCK, RESET;
    wire [31:0] OUTPUT;

    // init IFU module
    initial 
    begin
        $dumpfile("IFU_output_wave.vcd");
        $dumpvars(0,stimulus);      
    end

    // monitoring the changes in v alues
    initial
    $monitor($time, "CLOCK = %b, RESET = %b, Instruction Code = %h", CLOCK,RESET,OUTPUT);

    // init reset
    initial
    begin
        RESET = 1'b0;
        #20 RESET = 1'b1;
        #200 RESET = 1'b0;
        #100 RESET = 1'b1;
    end

    // init the clock
    initial
    begin
        CLOCK = 1;
        forever #20 CLOCK = ~CLOCK;
            
    end

    initial
    #400 $finish;


endmodule