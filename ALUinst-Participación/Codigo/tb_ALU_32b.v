`timescale 1ns/1ps

module tb_ALU_32b();

reg  [31:0] A, B;
reg  [2:0]  ALUControl;
reg         cin, bin;

wire [31:0] Result;
wire        cout, bout;

// Instancia de la ALU
ALU_32b alu (
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .cin(cin),
    .bin(bin),
    .Result(Result),
    .cout(cout),
    .bout(bout)
);

initial begin
    // Inicializar señales
    cin = 0;
    bin = 0;
    A = 25;
    B = 15;

    // Prueba suma (ALUControl = 010)
    ALUControl = 3'b010;
    #10;
    $display("SUMA: %d + %d = %d, cout=%b", A, B, Result, cout);

    // Prueba resta (ALUControl = 110)
    ALUControl = 3'b110;
    #10;
    $display("RESTA: %d - %d = %d, bout=%b", A, B, Result, bout);

    // Prueba SLT (ALUControl = 111)
    ALUControl = 3'b111;
    #10;
    $display("SLT: %d < %d = %d", A, B, Result);

    $stop; // termina simulación
end

endmodule
