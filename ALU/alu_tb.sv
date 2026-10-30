`include "alu.sv"

module stimulus ();
    reg [31:0] A, B;
    reg [3:0] ALUcontrol;
    wire ZERO;
    wire [31:0] ALUresult;


    // instantiating modules
    ALU ALUmodule(.in1(A), .in2(B), .alu_control(ALUcontrol), .zero_flag(ZERO), .alu_result(ALUresult));

    // setting up waveform
    initial begin
        $dumpfile("output_wave.vcd");
        $dumpvars(0,stimulus);
    end

    // monitoring changing values
    initial 
    $monitor($time, "\nInput_1 = %b, \nInput_2 = %b,\nALU_control = %b,\n ALU_result = %b, Zero_flag = %b\n" , A, B, ALUcontrol, ALUresult, ZERO);

    // test conditions
    initial begin
        A = 23; B = 42;  ALUControl = 4'b0000;
    #20 A = 23; B = 42;  ALUControl = 4'b0001;
    #20 A = 23; B = 42;  ALUControl = 4'b0010;
    #20 A = 23; B = 42;  ALUControl = 4'b0100;
    #20 A = 23; B = 42;  ALUControl = 4'b1000;
    #20 A = 42; B = 23;  ALUControl = 4'b1000;
    #20 A = 42; B = 23;  ALUControl = 4'b0100;
    end

    // finish after 150 clock cycles
    initial
    #150 $finish


endmodule