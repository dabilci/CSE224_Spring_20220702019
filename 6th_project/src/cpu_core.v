module cpu_core(
    input clk,
    input reset,
    input enable,
    output [31:0] display_out
);

parameter ADDI = 6'b001000;
parameter ADD = 6'b000000;
parameter SUBI = 6'b001001;
parameter SHIFTL = 6'b000010;
parameter BEQ = 6'b000100;
parameter J = 6'b000010;

reg [31:0] pc;
reg [31:0] registers [0:31];
wire [31:0] instruction;
wire [5:0] opcode;
wire [4:0] rs, rt, rd;
wire [15:0] immediate;
wire [25:0] jump_addr;
wire [31:0] alu_result;
wire [31:0] reg_data1, reg_data2;
wire zero_flag;
reg pc_write_enable;
reg reg_write_enable;
reg [31:0] write_data;
reg [4:0] write_reg;

assign opcode = instruction[31:26];
assign rs = instruction[25:21];
assign rt = instruction[20:16];
assign rd = instruction[15:11];
assign immediate = instruction[15:0];
assign jump_addr = instruction[25:0];

assign reg_data1 = registers[rs];
assign reg_data2 = registers[rt];

instruction_memory imem(
    .address(pc[9:2]),
    .instruction(instruction)
);

alu main_alu(
    .a(reg_data1),
    .b(opcode == ADDI || opcode == SUBI ? {{16{immediate[15]}}, immediate} : reg_data2),
    .op(opcode),
    .result(alu_result),
    .zero(zero_flag)
);

assign display_out = registers[30];

always @(posedge clk or posedge reset) begin
    if (reset) begin
        pc <= 0;
        pc_write_enable <= 0;
        reg_write_enable <= 0;
        registers[0] <= 0;
    end else if (enable) begin
        pc_write_enable <= 1;
        
        case (opcode)
            ADDI: begin
                write_reg <= rt;
                write_data <= reg_data1 + {{16{immediate[15]}}, immediate};
                reg_write_enable <= 1;
                pc <= pc + 4;
            end
            
            ADD: begin
                write_reg <= rd;
                write_data <= reg_data1 + reg_data2;
                reg_write_enable <= 1;
                pc <= pc + 4;
            end
            
            SUBI: begin
                write_reg <= rt;
                write_data <= reg_data1 - {{16{immediate[15]}}, immediate};
                reg_write_enable <= 1;
                pc <= pc + 4;
            end
            
            SHIFTL: begin
                write_reg <= rd;
                write_data <= reg_data1 << reg_data2[4:0];
                reg_write_enable <= 1;
                pc <= pc + 4;
            end
            
            BEQ: begin
                reg_write_enable <= 0;
                if (reg_data1 == reg_data2) begin
                    pc <= pc + 4 + ({{14{immediate[15]}}, immediate, 2'b00});
                end else begin
                    pc <= pc + 4;
                end
            end
            
            J: begin
                reg_write_enable <= 0;
                pc <= {pc[31:28], jump_addr, 2'b00};
            end
            
            default: begin
                reg_write_enable <= 0;
                pc <= pc + 4;
            end
        endcase
        
        if (reg_write_enable && write_reg != 0) begin
            registers[write_reg] <= write_data;
        end
        
        registers[0] <= 0;
    end
end

endmodule 