module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire coutA, coutB;
    wire [15:0] sum1,sum2;
    add16 instance1(a[15:0], b[15:0],1'b0, sum1,coutA);
    add16 instance2(a[31:16], b[31:16],coutA, sum2,coutB);
    assign sum={sum2,sum1};
    
   

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

// Full adder module here

endmodule
