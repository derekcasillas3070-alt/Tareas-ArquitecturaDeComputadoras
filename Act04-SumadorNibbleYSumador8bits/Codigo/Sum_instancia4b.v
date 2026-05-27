`timescale 1ns/1ps

module Sum_instancia4b(
    input  wire [3:0] i_bit1,
    input  wire [3:0] i_bit2,
    input  wire       i_carry,
    output wire [3:0] o_suma,
    output wire       o_carry
);
    wire c1, c2, c3;

    FA fa0 (.a(i_bit1[0]), .b(i_bit2[0]), .cin(i_carry), .s(o_suma[0]), .cout(c1));
    FA fa1 (.a(i_bit1[1]), .b(i_bit2[1]), .cin(c1),      .s(o_suma[1]), .cout(c2));
    FA fa2 (.a(i_bit1[2]), .b(i_bit2[2]), .cin(c2),      .s(o_suma[2]), .cout(c3));
    FA fa3 (.a(i_bit1[3]), .b(i_bit2[3]), .cin(c3),      .s(o_suma[3]), .cout(o_carry));
endmodule

