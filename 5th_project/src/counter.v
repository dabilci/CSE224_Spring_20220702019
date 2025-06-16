module program_counter(
    input wire clk,
    input wire control,
    input wire reset,
    output reg [31:0] pc
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        pc <= 32'b0;
    end else if (control) begin
        pc <= pc + 1;
    end
end

endmodule