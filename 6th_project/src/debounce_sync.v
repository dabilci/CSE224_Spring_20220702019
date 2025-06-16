module debounce_sync(
    input clk,
    input reset,
    input btn_in,
    output btn_out
);

reg [19:0] counter;
reg btn_sync1, btn_sync2;
reg btn_state;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        btn_sync1 <= 0;
        btn_sync2 <= 0;
        btn_state <= 0;
        counter <= 0;
    end else begin
        btn_sync1 <= btn_in;
        btn_sync2 <= btn_sync1;
        
        if (btn_sync2 == btn_state) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
            if (counter == 20'hFFFFF) begin
                btn_state <= btn_sync2;
                counter <= 0;
            end
        end
    end
end

assign btn_out = btn_state;

endmodule 