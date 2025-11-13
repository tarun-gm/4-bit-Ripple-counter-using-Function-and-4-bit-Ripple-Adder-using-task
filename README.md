# 4-bit-Ripple-counter-using-Function-and-4-bit-Ripple-Adder-using-task

# Aim
To design and simulate a 4-bit-Ripple-counter-using-Function-and-4-bit-Ripple-Adder-using-task using Verilog HDL, and verify its functionality through a testbench in the Vivado 2023.1 environment. 

# Apparatus Required
Vivado 2023.1
# Procedure
1. Launch Vivado 2023.1
Open Vivado and create a new project.
2. Design the Verilog Code
Write the Verilog code for the seven-segment display, defining the logic that maps a 4-bit binary input to the corresponding segments (a to g) of the display.
3. Create the Testbench
Write a testbench to simulate the seven-segment display behavior. The testbench should apply various 4-bit input values and monitor the corresponding output.
4. Create the Verilog Files
Create both the design module and the testbench in the Vivado project.
5. Run Simulation
Run the behavioral simulation to verify the output. 
6. Observe the Waveforms
Analyze the output waveforms in the simulation window, and verify that the correct segments light up for each digit.
7. Save and Document Results
Capture screenshots of the waveform and save the simulation logs. These will be included in the lab report.

# Verilog Code
# 4 bit Ripple Adder using Task
```

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

```

# Test Bench
```
module rippleadderusingtask_tb;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    rippleadderusingtask uut(A, B, Cin, Sum, Cout);

    initial begin
        A = 4'b0000; B = 4'b0000; Cin = 0;
        #10 A = 4'b0101; B = 4'b0011; Cin = 0;
        #10 A = 4'b1111; B = 4'b0001; Cin = 0;
        #10 A = 4'b1010; B = 4'b0101; Cin = 1;
        #10 A = 4'b1100; B = 4'b1100; Cin = 1;
        #10 $stop;
    end
endmodule

```


# Output Waveform
<img width="1918" height="1078" alt="image" src="https://github.com/user-attachments/assets/27dca5bb-2b88-45db-bb18-f8161a024d10" />

# 4 bit Ripple counter using Function
// 4-bit Ripple Counter using Function
```
module ripple_counter_func (
    input clk, rst,
    output reg [3:0] Q
);

    function [3:0] count;
     ///
    endfunction

    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 4'b0000;
        else
            Q <= count(Q);  // use function to increment
    end
endmodule
```

# Test Bench
```
module ripplecountertb;
reg clk_t, rst_t;
wire [3:0] q_t;

ripplecounter dut(.clk(clk_t), .rst(rst_t), .Q(q_t));

initial begin
    clk_t = 0;
    rst_t = 1;
    #10 rst_t = 0;
end

always #10 clk_t = ~clk_t;
endmodule
```

# Output Waveform 
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/83017847-88d1-47bb-8763-fa1d93a0ac07" />


# Conclusion
In this experiment, a 4-bit-Ripple-counter-using-Function-and-4-bit-Ripple-Adder-using-task was successfully designed and simulated using Verilog HDL.
