`timescale 1ns/1ps

module Sum_com8b(
    input  wire [7:0] i_bit1,
    input  wire [7:0] i_bit2,
    input  wire       i_carry,
    output wire [7:0] o_suma,
    output wire       o_carry
);
    wire [8:0] tmp;
    assign tmp = {1'b0, i_bit1} + {1'b0, i_bit2} + i_carry;

    assign o_suma  = tmp[7:0];
    assign o_carry = tmp[8];
endmodule

