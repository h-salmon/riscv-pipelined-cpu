// testbench for IF stage: PC + instruction memory
`timescale 1ns/1ps

module if_tb;

// --- signals ---
reg        clk;
reg        reset;
reg        pc_write;
reg [31:0] pc_next;
wire [31:0] pc_out;
wire [31:0] instruction;

// --- instantiate PC ---
pc uut_pc (
    .clk(clk),
    .reset(reset),
    .pc_write(pc_write),
    .pc_next(pc_next),
    .pc_out(pc_out)
);

// --- instantiate instruction memory ---
imem uut_imem (
    .addr(pc_out),
    .instruction(instruction)
);

// --- waveform dump ---
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, if_tb);
end

// --- test logic ---
initial begin
    // initialize
    clk      = 0;
    reset    = 1;
    pc_write = 1;
    pc_next  = 32'd0;

    // hold reset for one cycle
    #2; clk = 1; #2; clk = 0;
    reset = 0;

    // cycle through 8 instructions
    // each cycle: set pc_next = pc_out + 4, then clock
    repeat (8) begin
        pc_next = pc_out + 32'd4;
        #2; clk = 1; #2; clk = 0;
        $display("PC = %2d | instruction = %h", pc_out, instruction);
    end

    $display("IF stage test completed");
    $finish;
end

endmodule
