module top_module(
    input wire clk,
    input wire control,
    input wire reset,
    output wire [31:0] result
);

wire [31:0] instruction;
wire [31:0] pc;
wire [4:0] rs1, rs2, rd;
wire [31:0] immediate;
wire [2:0] alu_op;
wire [31:0] reg_data1, reg_data2;
wire [31:0] alu_result;
wire reg_write;

program_counter pc_inst(
    .clk(clk),
    .control(control),
    .reset(reset),
    .pc(pc)
);

instruction_memory imem_inst(
    .pc(pc),
    .instruction(instruction)
);

instruction_decoder decoder_inst(
    .instruction(instruction),
    .control(control),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .immediate(immediate),
    .alu_op(alu_op),
    .reg_write(reg_write)
);

register_file rf_inst(
    .clk(clk),
    .reset(reset),
    .read_reg1(rs1),
    .read_reg2(rs2),
    .write_reg(rd),
    .write_data(alu_result),
    .reg_write(reg_write),
    .read_data1(reg_data1),
    .read_data2(reg_data2)
);

alu alu_inst(
    .a(reg_data1),
    .b((alu_op == 3'b110 || alu_op == 3'b111) ? immediate : reg_data2),
    .alu_op(alu_op),
    .result(alu_result)
);

assign result = alu_result;

endmodule