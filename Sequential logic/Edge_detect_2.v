module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);

    reg [7:0] prev;

    always @(posedge clk) begin
        anyedge <= prev ^in;  // Detect 0->1 transitions
        prev  <= in;          // Save current input
    end

endmodule