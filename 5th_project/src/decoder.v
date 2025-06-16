module instruction_decoder(
    input wire [31:0] instruction,
    input wire control,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [4:0] rd,
    output reg [31:0] immediate,
    output reg [2:0] alu_op,
    output reg reg_write
);

always @(*) begin
    if (!control) begin
        rs1 = 5'b0;
        rs2 = 5'b0;
        rd = 5'b0;
        immediate = 32'b0;
        alu_op = 3'b000;
        reg_write = 1'b0;
    end else begin
        case (instruction[6:0])
            7'b0010110: begin
                rs1 = instruction[19:15];
                rs2 = 5'b0;
                rd = instruction[11:7];
                immediate = {{20{instruction[31]}}, instruction[31:20]};
                alu_op = 3'b110;
                reg_write = 1'b1;
            end
            7'b0110110: begin
                rs1 = instruction[19:15];
                rs2 = 5'b0;
                rd = instruction[11:7];
                immediate = {{20{instruction[31]}}, instruction[31:20]};
                alu_op = 3'b111;
                reg_write = 1'b1;
            end
            7'b0010000: begin
                rs1 = instruction[19:15];
                rs2 = instruction[24:20];
                rd = instruction[11:7];
                immediate = 32'b0;
                alu_op = 3'b010;
                reg_write = 1'b1;
            end
            7'b0100000: begin
                rs1 = instruction[19:15];
                rs2 = instruction[24:20];
                rd = instruction[11:7];
                immediate = 32'b0;
                alu_op = 3'b100;
                reg_write = 1'b1;
            end
            default: begin
                rs1 = 5'b0;
                rs2 = 5'b0;
                rd = 5'b0;
                immediate = 32'b0;
                alu_op = 3'b000;
                reg_write = 1'b0;
            end
        endcase
    end
end

endmodule