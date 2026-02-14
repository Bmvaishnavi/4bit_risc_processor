module cpu_top(input clk, input reset);

wire [3:0] pc;
wire [7:0] instruction;
wire [1:0] opcode = instruction[7:6];
wire [1:0] rd = instruction[5:4];
wire [1:0] rs = instruction[3:2];
wire [1:0] rt = instruction[1:0];

wire reg_write, mem_read, mem_write;
wire [1:0] alu_op;
wire [3:0] read1, read2, alu_result, mem_data, write_data;

program_counter PC(clk, reset, pc);
instruction_memory IM(pc, instruction);
control_unit CU(opcode, reg_write, mem_read, mem_write, alu_op);
register_file RF(clk, reg_write, rs, rt, rd, write_data, read1, read2);
alu ALU(read1, read2, alu_op, alu_result);
data_memory DM(clk, mem_write, mem_read, alu_result, read2, mem_data);

assign write_data = (mem_read) ? mem_data : alu_result;

endmodule
