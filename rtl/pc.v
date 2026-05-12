module pc (
    input        clk,
    input        reset,
    input        pc_write,    // stall control: 0 = freeze PC (for hazards later)
    input [31:0] pc_next,     // next PC value (PC+4 or branch target)
    output reg [31:0] pc_out  // current PC sent to instruction memory
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 32'd0;        // on reset, start at address 0
        else if (pc_write)
            pc_out <= pc_next;      // only update if not stalled
    end

endmodule
