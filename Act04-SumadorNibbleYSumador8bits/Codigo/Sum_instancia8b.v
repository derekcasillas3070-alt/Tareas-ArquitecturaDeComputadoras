`timescale 1ns/1ps

module Sum_instancia8b(
    input  wire [7:0] i_bit1,
    input  wire [7:0] i_bit2,
    input  wire       i_carry,
    output wire [7:0] o_suma,
    output wire       o_carry
);
    wire c1, c2, c3, c4, c5, c6, c7;

    FA fa0 (.a(i_bit1[0]), .b(i_bit2[0]), .cin(i_carry), .s(o_suma[0]), .cout(c1));
    FA fa1 (.a(i_bit1[1]), .b(i_bit2[1]), .cin(c1),      .s(o_suma[1]), .cout(c2));
    FA fa2 (.a(i_bit1[2]), .b(i_bit2[2]), .cin(c2),      .s(o_suma[2]), .cout(c3));
    FA fa3 (.a(i_bit1[3]), .b(i_bit2[3]), .cin(c3),      .s(o_suma[3]), .cout(c4));
    FA fa4 (.a(i_bit1[4]), .b(i_bit2[4]), .cin(c4),      .s(o_suma[4]), .cout(c5));
    FA fa5 (.a(i_bit1[5]), .b(i_bit2[5]), .cin(c5),      .s(o_suma[5]), .cout(c6));
    FA fa6 (.a(i_bit1[6]), .b(i_bit2[6]), .cin(c6),      .s(o_suma[6]), .cout(c7));
    FA fa7 (.a(i_bit1[7]), .b(i_bit2[7]), .cin(c7),      .s(o_suma[7]), .cout(o_carry));
endmodule

