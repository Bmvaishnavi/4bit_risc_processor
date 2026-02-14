module alu(
    input [3:0] A,
    input [3:0] B,
    input [1:0] alu_op,
    output reg [3:0] result
);

always @(*) begin
    case(alu_op)
        2'b00: result = A + B; // ADD
        2'b01: result = A - B; // SUB
        default: result = 4'b0000;
    endcase
end

endmodule
