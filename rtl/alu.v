module alu 
    (input [31:0] a, 
    input [31:0] b,
    input [3:0] alu_control, //I use 4 bits for added flexibility for later, I couldve used 3 bits here
    output reg [31:0] alu_result
    );
always @(*) begin //recomputes output whenever any input changes
    case (alu_control)
        4'b0000: alu_result = a & b; // AND
        4'b0001: alu_result = a | b; // OR
        4'b0010: alu_result = a + b; // ADD
        4'b0110: alu_result = a - b; // SUBTRACT
        4'b0111: alu_result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0; // SLT, make widths explicit!
        default: alu_result = 32'd0; // Default case
    endcase

end

endmodule