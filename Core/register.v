// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(negedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end
endmodule // register

// 32 bits of D Flip-Flops with enable.
// Positive edge triggered
module register32
(
output [31:0] q,
input[31:0] d,
input wrenable,
input clk
);

    register r0 (q[0], d[0], wrenable, clk);
    register r1 (q[1], d[1], wrenable, clk);
    register r2 (q[2], d[2], wrenable, clk);
    register r3 (q[3], d[3], wrenable, clk);
    register r4 (q[4], d[4], wrenable, clk);
    register r5 (q[5], d[5], wrenable, clk);
    register r6 (q[6], d[6], wrenable, clk);
    register r7 (q[7], d[7], wrenable, clk);
    register r8 (q[8], d[8], wrenable, clk);
    register r9 (q[9], d[9], wrenable, clk);
    register r10 (q[10], d[10], wrenable, clk);
    register r11 (q[11], d[11], wrenable, clk);
    register r12 (q[12], d[12], wrenable, clk);
    register r13 (q[13], d[13], wrenable, clk);
    register r14 (q[14], d[14], wrenable, clk);
    register r15 (q[15], d[15], wrenable, clk);
    register r16 (q[16], d[16], wrenable, clk);
    register r17 (q[17], d[17], wrenable, clk);
    register r18 (q[18], d[18], wrenable, clk);
    register r19 (q[19], d[19], wrenable, clk);
    register r20 (q[20], d[20], wrenable, clk);
    register r21 (q[21], d[21], wrenable, clk);
    register r22 (q[22], d[22], wrenable, clk);
    register r23 (q[23], d[23], wrenable, clk);
    register r24 (q[24], d[24], wrenable, clk);
    register r25 (q[25], d[25], wrenable, clk);
    register r26 (q[26], d[26], wrenable, clk);
    register r27 (q[27], d[27], wrenable, clk);
    register r28 (q[28], d[28], wrenable, clk);
    register r29 (q[29], d[29], wrenable, clk);
    register r30 (q[30], d[30], wrenable, clk);
    register r31 (q[31], d[31], wrenable, clk);
endmodule // register32



// 1 bit register with constant output 0.
// Inputs are ignored.
module register32zero
(
output [31:0] q,
input[31:0] d,
input wrenable,
input clk
);
	assign q = 0;
endmodule // register32zero
