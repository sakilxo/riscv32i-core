/*
The instruction fetch unit has clock and reset pins as input and 32-bit instruction code as output.
Internally the block has Instruction Memory, Program Counter(P.C) and an adder to increment counter by 4, 
on every positive clock edge.
*/

module IFU (
    input clock, reset,
    output [31:0] Instruction_Code
);

reg [31:0] PC = 32'b0;      // 32 bit program counter is init to zero

    // init the instruction memory block 
    INST_MEM instr_mem(PC, reset, Instruction_Code);

    always @(posedge clock, posedge reset)
    begin
        if (reset == 1)     // if reset is 1, clear the PC
        PC <= 0;
        else
        PC <= PC + 4       // increment PC on positive clock edge
    end


endmodule