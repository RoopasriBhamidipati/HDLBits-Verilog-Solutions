module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum
);

    // Internal wires to carry the intermediate ripple-carry signals
    wire c1, c2, c3;

    // Instantiate the first BCD adder for the least significant digit (LSD)
    bcd_fadd fadd0 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(c1),
        .sum(sum[3:0])
    );

    // Instantiate the second BCD adder
    bcd_fadd fadd1 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c1),
        .cout(c2),
        .sum(sum[7:4])
    );

    // Instantiate the third BCD adder
    bcd_fadd fadd2 (
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(c2),
        .cout(c3),
        .sum(sum[11:8])
    );

    // Instantiate the fourth BCD adder for the most significant digit (MSD)
    bcd_fadd fadd3 (
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(c3),
        .cout(cout),
        .sum(sum[15:12])
    );

endmodule