`timescale 1ns/1ps

module Tb_Sum4b;

    reg  [3:0] a, b;
    reg        cin;

    wire [3:0] s_inst, s_com;
    wire       c_inst, c_com;

    // DUTs
    Sum_instancia4b U1 (
        .i_bit1(a), .i_bit2(b), .i_carry(cin),
        .o_suma(s_inst), .o_carry(c_inst)
    );

    Sum_com4b U2 (
        .i_bit1(a), .i_bit2(b), .i_carry(cin),
        .o_suma(s_com), .o_carry(c_com)
    );

    task apply_vec(input [3:0] ta, input [3:0] tb, input tcin);
        begin
            a = ta; b = tb; cin = tcin;
            #10;

            // Mostrar en decimal (resultado de 5 bits: carry+suma)
            $display("4b: A=%0d B=%0d Cin=%0d | INST=%0d (C=%0d S=%0d) | COM=%0d (C=%0d S=%0d)",
                     a, b, cin,
                     {c_inst, s_inst}, c_inst, s_inst,
                     {c_com,  s_com},  c_com,  s_com);

            // Comparación
            if ( (s_inst !== s_com) || (c_inst !== c_com) ) begin
                $display("**ERROR** No coincide instanciado vs comportamental");
            end
        end
    endtask

    initial begin
        $display("=== TB Sumador 4 bits: 5 pruebas ===");

        // 5 sumas (puedes cambiarlas si quieres)
        apply_vec(4'd3,  4'd5,  1'b0); // 3 + 5
        apply_vec(4'd9,  4'd6,  1'b0); // 9 + 6
        apply_vec(4'd15, 4'd1,  1'b0); // 15 + 1 (overflow)
        apply_vec(4'd7,  4'd8,  1'b1); // 7 + 8 + Cin
        apply_vec(4'd0,  4'd0,  1'b1); // 0 + 0 + Cin

        $display("=== Fin TB 4 bits ===");
        $stop;
    end

endmodule

