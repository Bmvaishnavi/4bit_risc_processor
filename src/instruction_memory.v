module instruction_memory(
    input [3:0] addr,
    output reg [7:0] instruction
);

reg [7:0] mem [0:15];

initial begin
    mem[0] = 8'b00_01_00_01; // ADD R1,R0,R1
    mem[1] = 8'b00_10_01_01; // ADD R2,R1,R1
    mem[2] = 8'b01_11_10_01; // SUB R3,R2,R1
    mem[3] = 8'b11_11_00_10; // STORE R3 -> mem[2]
end

always @(*) instruction = mem[addr];

endmodule
