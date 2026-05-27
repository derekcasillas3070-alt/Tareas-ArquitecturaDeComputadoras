//sumador 32 bits comportamental

module Sum_32b(
input  [31:0] A,
input  [31:0] B,
input        cin,
output [31:0] S,
output       cout
);

wire [32:0] suma;

assign suma = A + B + cin;
assign S = suma[31:0];
assign cout = suma[32];

endmodule

//Restador 32 bit scomportamnetal

module Res_32b(
input  [31:0] A,
input  [31:0] B,
input        bin,
output [31:0] S,
output       bout
);

wire [32:0] resta;

assign resta = {1'b0, A} - {1'b0, B} - bin;
assign S = resta[31:0];
assign bout = resta[32];

endmodule 

//OR 32 bits
module OR_32bit(
input[31:0] A,
input [31:0]B,
output [31:0]OR
);
assign OR = A | B;

endmodule 

//AND 32 bits
module AND_32bit(
input [31:0]A,
input [31:0]B,
output [31:0]AND
);
assign AND = A & B;

endmodule 

// SLT 32 bits 
module SLT_32b(
input  [31:0] A,
input  [31:0] B,
output [31:0] S
);

assign S = (A < B) ? 32'b00000001 : 32'b00000000;

endmodule

// MUX DE SALIDA 
module muxSal(
    input  [31:0] suma,
    input  [31:0] resta,
    input  [31:0] _or,
    input  [31:0] _and,
    input  [31:0] slt,
    input  [2:0]  ALUctl,
    output reg [31:0] Resultado
);
//declaracion de wires: NA 
//declaracion de regs: NA 
//Bloque secuencial
always @(*) begin
    case(ALUctl)
        3'b000: Resultado = _and;   // AND
        3'b001: Resultado = _or;    // OR
        3'b010: Resultado = suma;   // SUMA
        3'b110: Resultado = resta;  // RESTA
        3'b111: Resultado = slt;    // SLT
        default: Resultado = 32'b0;
    endcase
end

endmodule


// ALU 32 
module ALU_32b(
    input  [31:0] A,
    input  [31:0] B,
    input  [2:0]  ALUControl,
    input         cin,
    input         bin,
    output [31:0] Result,
    output        cout,
    output        bout
);

// Señales internas
wire [31:0] sum_out;
wire [31:0] res_out;
wire [31:0] and_out;
wire [31:0] or_out;
wire [31:0] slt_out;

wire cout_internal;
wire bout_internal;


// Instancias

Sum_32b SUMADOR (
    .A(A),
    .B(B),
    .cin(cin),
    .S(sum_out),
    .cout(cout_internal)
);

Res_32b RESTADOR (
    .A(A),
    .B(B),
    .bin(bin),
    .S(res_out),
    .bout(bout_internal)
);

AND_32bit AND_GATE (
    .A(A),
    .B(B),
    .AND(and_out)
);

OR_32bit OR_GATE (
    .A(A),
    .B(B),
    .OR(or_out)
);

SLT_32b SLT_UNIT (
    .A(A),
    .B(B),
    .S(slt_out)
);

muxSal MUX_RESULTADO (
    .suma(sum_out),
    .resta(res_out),
    ._or(or_out),
    ._and(and_out),
    .slt(slt_out),
    .ALUctl(ALUControl),
    .Resultado(Result)
);

assign cout = cout_internal;
assign bout = bout_internal;

endmodule