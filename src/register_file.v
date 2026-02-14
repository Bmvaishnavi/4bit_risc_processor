module register_file(
    input clk,
    input reg_write,
    input [1:0] rs,
    input [1:0] rt,
    input [1:0] rd,
    input [3:0] write_data,
    output [3:0] read_data1,
    output [3:0] read_data2
);

reg [3:0] registers [0:3];

assign read_data1 = registers[rs];
assign read_data2 = registers[rt];

always @(posedge clk) begin
    if(reg_write)
        registers[rd] <= write_data;
end

endmodule
