module seven_seg_dual(
    input clk,
    input [15:0] data,
    output [6:0] seg1,
    output [6:0] seg2
);

wire [3:0] digit1, digit2;

assign digit1 = data[7:4];
assign digit2 = data[3:0];

seven_seg_decoder dec1(
    .digit(digit1),
    .segments(seg1)
);

seven_seg_decoder dec2(
    .digit(digit2),
    .segments(seg2)
);

endmodule

module seven_seg_decoder(
    input [3:0] digit,
    output reg [6:0] segments
);

always @(*) begin
    case (digit)
        4'h0: segments = 7'b1000000;
        4'h1: segments = 7'b1111001;
        4'h2: segments = 7'b0100100;
        4'h3: segments = 7'b0110000;
        4'h4: segments = 7'b0011001;
        4'h5: segments = 7'b0010010;
        4'h6: segments = 7'b0000010;
        4'h7: segments = 7'b1111000;
        4'h8: segments = 7'b0000000;
        4'h9: segments = 7'b0010000;
        4'hA: segments = 7'b0001000;
        4'hB: segments = 7'b0000011;
        4'hC: segments = 7'b1000110;
        4'hD: segments = 7'b0100001;
        4'hE: segments = 7'b0000110;
        4'hF: segments = 7'b0001110;
        default: segments = 7'b1111111;
    endcase
end

endmodule 