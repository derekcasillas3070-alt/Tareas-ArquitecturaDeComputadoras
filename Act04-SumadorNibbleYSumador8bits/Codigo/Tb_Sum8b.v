`timescale 1ns/1ps

module Tb_Sum8b;

    reg  [7:0] a, b;
    reg        cin;

    wire [7:0] s_inst, s_com;
    wire       c_inst, c_com;

    // DUTs
    Sum_instancia8b U1 (
        .i_bit1(a), .i_bit2(b), .i_carry(cin),
        .o_suma(s_inst), .o_carry(c_inst)
    );

    Sum_com8b U2 (
        .i_bit1(a), .i_bit2(b), .i_carry(cin),
        .o_suma(s_com), .o_carry(c_com)
    );

    task apply_vec(input [7:0] ta, input [7:0] tb, input tcin);
        begin
            a = ta; b = tb; cin = tcin;
            #10;

            // Mostrar en decimal (resultado de 9 bits: carry+suma)
            $display("8b: A=%0d B=%0d Cin=%0d | INST=%0d (C=%0d S=%0d) | COM=%0d (C=%0d S=%0d)",
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
        $display("=== TB Sumador 8 bits: 5 pruebas ===");

        // 5 sumas (puedes cambiarlas si quieres)
        apply_vec(8'd10,  8'd25,  1'b0);  // 10 + 25
        apply_vec(8'd200, 8'd55,  1'b0);  // 200 + 55
        apply_vec(8'd255, 8'd1,   1'b0);  // 255 + 1 (overflow)
        apply_vec(8'd128, 8'd127, 1'b1);  // 128 + 127 + Cin
        apply_vec(8'd0,   8'd0,   1'b1);  // 0 + 0 + Cin

        $display("=== Fin TB 8 bits ===");
        $stop;
    end

endmodule

