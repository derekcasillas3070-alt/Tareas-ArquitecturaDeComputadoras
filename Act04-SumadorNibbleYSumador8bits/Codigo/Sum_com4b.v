`timescale 1ns/1ps

module Sum_com4b(
    input  wire [3:0] i_bit1,
    input  wire [3:0] i_bit2,
    input  wire       i_carry,
    output wire [3:0] o_suma,
    output wire       o_carry
);
    wire [4:0] tmp;
    assign tmp = {1'b0, i_bit1} + {1'b0, i_bit2} + i_carry;

    assign o_suma  = tmp[3:0];
    assign o_carry = tmp[4];
endmodule

