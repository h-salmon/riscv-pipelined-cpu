// IF/ID pipeline register
// sits between IF and ID stages, latches on every rising clock edge
`timescale 1ns/1ps

module if_id_reg (
    input        clk,
    input        reset,
    input        if_id_write,   // stall control: 0 = freeze (for hazards later)
    input [31:0] pc_in,         // PC value from IF stage
    input [31:0] instr_in,      // instruction from imem
    output reg [31:0] pc_out,   // PC passed to ID stage
    output reg [31:0] instr_out // instruction passed to ID stage
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc_out    <= 32'd0;
            instr_out <= 32'd0;  // NOP on reset
        end
        else if (if_id_write) begin
            pc_out    <= pc_in;
            instr_out <= instr_in;
        end
    end

endmodule
