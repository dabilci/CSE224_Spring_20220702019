module instruction_memory(
    input [7:0] address,
    output [31:0] instruction
);

reg [31:0] memory [0:255];

initial begin
    memory[0] = 32'h20800010;
    memory[1] = 32'h20200015;
    memory[2] = 32'h00414020;
    memory[3] = 32'h21000005;
    memory[4] = 32'h20800002;
    memory[5] = 32'h0800000A;
    memory[6] = 32'h00000000;
    memory[7] = 32'h00000000;
    memory[8] = 32'h00000000;
    memory[9] = 32'h00000000;
    memory[10] = 32'h20800004;
    memory[11] = 32'h00004020;
    memory[12] = 32'h11020007;
    memory[13] = 32'h20C00001;
    memory[14] = 32'h20E00001;
    memory[15] = 32'h00C73020;
    memory[16] = 32'h00E04020;
    memory[17] = 32'h00E84020;
    memory[18] = 32'h20A50001;
    memory[19] = 32'h0800000E;
end

assign instruction = memory[address];

endmodule 