module instruction_memory(
    input wire [31:0] pc,
    output reg [31:0] instruction
);

always @(*) begin
    case (pc[2:0])
        3'b000: instruction = 32'b00000000101000000000010100010110;
        3'b001: instruction = 32'b00000000111100000000011110010110;
        3'b010: instruction = 32'b00000001111001010000110010010000;
        3'b011: instruction = 32'b11111111101111001000101000110110;
        3'b100: instruction = 32'b00000000001000000000001010010110;
        3'b101: instruction = 32'b00000000010111001001111100100000;
        default: instruction = 32'b0;
    endcase
end

endmodule