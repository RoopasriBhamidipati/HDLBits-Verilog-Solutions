module full_adder( 
    input x, y, cin,
    output cout, sum );
    assign sum=x^y^cin;
    assign cout=(x&y)|(cin&(x^y));
    

endmodule

module top_module (
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum
);

    wire c1, c2, c3;

    full_adder fa0(x[0], y[0], 1'b0, c1,sum[0]);
    full_adder fa1(x[1], y[1], c1,  c2, sum[1]);
    full_adder fa2(x[2], y[2], c2,  c3 ,sum[2]);
    full_adder fa3(x[3], y[3], c3, sum[4]  ,sum[3]);

endmodule