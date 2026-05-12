module imem (
    input  [31:0] addr,          // address from PC
    output [31:0] instruction    // 32-bit instruction out
);

    reg [31:0] mem [0:255];      // 256 words = 1KB of instruction memory

    initial begin
        $readmemh("test_program.hex", mem);  // load program from hex file
    end

    // word-addressed: divide byte address by 4 (drop bottom 2 bits)
    assign instruction = mem[addr[9:2]];

endmodule
