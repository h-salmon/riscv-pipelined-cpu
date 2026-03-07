// test bench for register file
`timescale 1ns/1ps
module register_file_tb;
reg clk;
reg reg_write;
reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;
reg [31:0] write_data;
wire [31:0] read_data1;
wire [31:0] read_data2; //wire bc its output

register_file uut (
    .clk(clk),
    .reg_write(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, register_file_tb);

    // initialize signals
    clk = 0;
    reg_write = 0;
    rs1 = 5'd0;
    rs2 = 5'd0;
    rd = 5'd0;
    write_data = 32'd0;

    // Test 1: write to x1
    rd = 5'd1;
    write_data = 32'hDEADBEEF; // some test value, creative right?
    reg_write = 1;

    #2;
    clk = 1;   // rising edge -> write happens here
    #2;
    clk = 0;

    // read back x1
    reg_write = 0;
    rs1 = 5'd1;
    #1;

    if (read_data1 != 32'hDEADBEEF)
        $display("ERROR: Read back from x1 failed. Got %h", read_data1);

    // Test 2: try writing to x0
    rd = 5'd0;
    write_data = 32'hFFFFFFFF;
    reg_write = 1;

    #2;
    clk = 1;   // rising edge
    #2;
    clk = 0;

    // read x0
    reg_write = 0;
    rs1 = 5'd0;
    #1;

    if (read_data1 != 32'd0)
        $display("ERROR: x0 should always read as 0. Got %h", read_data1);

    $display("Register file test completed");
    $finish;
    
end

endmodule