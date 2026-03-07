//test bench for ALU
`timescale 1ns/1ps

module alu_tb;

reg [31:0] a;
reg [31:0] b;
reg [3:0] alu_control;
wire [31:0] alu_result;

alu uut (
    .a(a),
    .b(b),
    .alu_control(alu_control),
    .alu_result(alu_result)
);

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, alu_tb);

    a = 32'd10;
    b = 32'd5;

    alu_control = 4'b0000; // AND
    #10;
    if (alu_result != 32'd0)
        $display("ERROR: AND failed. Got %d", alu_result);

    alu_control = 4'b0001; // OR
    #10;
    if (alu_result != 32'd15)
        $display("ERROR: OR failed. Got %d", alu_result);

    alu_control = 4'b0010; // ADD
    #10;
    if (alu_result != 32'd15)
        $display("ERROR: ADD failed. Got %d", alu_result);

    alu_control = 4'b0110; // SUB
    #10;
    if (alu_result != 32'd5)
        $display("ERROR: SUB failed. Got %d", alu_result);

    alu_control = 4'b0111; // SLT
    #10;
    if (alu_result != 32'd0)
        $display("ERROR: SLT failed. Got %d", alu_result);

    $display("ALU test completed");
    $finish;
end

endmodule