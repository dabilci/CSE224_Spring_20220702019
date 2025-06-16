module step_controller(
    input clk,
    input reset,
    input btn_pulse,
    output reg step_enable
);

reg btn_prev;
wire btn_edge;

assign btn_edge = btn_pulse & ~btn_prev;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        btn_prev <= 0;
        step_enable <= 0;
    end else begin
        btn_prev <= btn_pulse;
        step_enable <= btn_edge;
    end
end

endmodule 