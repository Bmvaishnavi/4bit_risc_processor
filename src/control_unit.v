module control_unit(
    input [1:0] opcode,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg [1:0] alu_op
);

always @(*) begin
    case(opcode)
        2'b00: begin // ADD
            reg_write = 1;
            mem_read = 0;
            mem_write = 0;
            alu_op = 2'b00;
        end

        2'b01: begin // SUB
            reg_write = 1;
            mem_read = 0;
            mem_write = 0;
            alu_op = 2'b01;
        end

        2'b10: begin // LOAD
            reg_write = 1;
            mem_read = 1;
            mem_write = 0;
        end

        2'b11: begin // STORE
            reg_write = 0;
            mem_read = 0;
            mem_write = 1;
        end
    endcase
end

endmodule
