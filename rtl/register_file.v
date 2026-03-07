module register_file(
    input clk,
    input reg_write,
    input [4:0] rs1, //address of source register 1
    input [4:0] rs2, //address of source register 2
    input [4:0] rd, //address of destination register
    input [31:0] write_data, //Value that should be written to the register
    output [31:0] read_data1,
    output [31:0] read_data2
); 
reg [31:0] registers [31:0];//32 registers of 32 bits each

integer i;
// initialize registers to 0 for simulation
initial begin
    for (i = 0; i < 32; i = i + 1)
        registers[i] = 32'd0;
end


// the following enforce that x0 always returns 0, this is the read part
assign read_data1 = (rs1 == 0) ? 32'd0 : registers[rs1];
assign read_data2 = (rs2 == 0) ? 32'd0 : registers[rs2];

//write part
always @(posedge clk) begin
    if (reg_write && rd != 0) begin //only write if reg_write is high and rd is not x0
        registers[rd] <= write_data; //write data to the register at address rd
    end

end

endmodule