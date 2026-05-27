module compuertas_logicas(
    input a,
    input b,
    output out_and,
    output out_or,
    output out_not_a,
    output out_nand,
    output out_nor,
    output out_xor,
    output out_xnor
    );

    
    assign out_and   = a & b;       // and
    assign out_or    = a | b;       // or
    assign out_not_a = ~a;          // not
    assign out_nand  = ~(a & b);    // nand
    assign out_nor   = ~(a | b);    // nor suiza xdddd
    assign out_xor   = a ^ b;       // xor
    assign out_xnor  = ~(a ^ b);    // xnor

endmodule

