module full_adder(
    input x, y, cin,
    output cout, sum
);
    assign sum = x ^ y ^ cin;
    assign cout = (x & y) | (cin & (x ^ y));
endmodule

module top_module(
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum
);

    wire [99:0] c;

    full_adder fa0(a[0], b[0], cin, c[0], sum[0]);

    genvar i;
    generate
        for (i=1; i<100; i=i+1) begin : stage
            full_adder fa(a[i], b[i], c[i-1], c[i], sum[i]);
        end
    endgenerate

    assign cout = c[99];

endmodule