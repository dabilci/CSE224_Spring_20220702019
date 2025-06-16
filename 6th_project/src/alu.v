module alu(
    input [31:0] a,
    input [31:0] b,
    input [5:0] op,
    output reg [31:0] result,
    output zero
);

parameter ADDI = 6'b001000;
parameter ADD = 6'b000000;
parameter SUBI = 6'b001001;
parameter SHIFTL = 6'b000010;

always @(*) begin
    case (op)
        ADDI, ADD: result = a + b;
        SUBI: result = a - b;
        SHIFTL: result = a << b[4:0];
        default: result = 32'b0;
    endcase
end

assign zero = (result == 32'b0);

endmodule 