module cpu_top(
    input clk,
    input reset,
    input control_btn,
    output [6:0] seg1,
    output [6:0] seg2
);

wire [31:0] display_data;
wire step_enable;
wire btn_sync;

debounce_sync btn_debounce(
    .clk(clk),
    .reset(reset),
    .btn_in(control_btn),
    .btn_out(btn_sync)
);

step_controller step_ctrl(
    .clk(clk),
    .reset(reset),
    .btn_pulse(btn_sync),
    .step_enable(step_enable)
);

cpu_core cpu(
    .clk(clk),
    .reset(reset),
    .enable(step_enable),
    .display_out(display_data)
);

seven_seg_dual display(
    .clk(clk),
    .data(display_data[15:0]),
    .seg1(seg1),
    .seg2(seg2)
);

endmodule 