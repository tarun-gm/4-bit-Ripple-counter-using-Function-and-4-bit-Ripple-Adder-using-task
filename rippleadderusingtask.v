
module rippleadderusingtask (
    input  [3:0] A, B,
    input  Cin,
    output reg [3:0] Sum,
    output reg Cout
);

    reg c;
    integer i;

    task full_adder;
        input a, b, cin;
        output s, cout;
        begin
            s = a ^ b ^ cin;
            cout = (a & b) | (b & cin) | (a & cin);
        end
    endtask

    always @(*) begin
        c = Cin;
        for (i = 0; i < 4; i = i + 1) begin
            full_adder(A[i], B[i], c, Sum[i], c);
        end
        Cout = c;
    end

endmodule
