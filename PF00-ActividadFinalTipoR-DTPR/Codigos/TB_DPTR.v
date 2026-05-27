`timescale 1ns/1ps
module TB_DPTR();
 
    reg [31:0] Instr;
    DPTR dut(.InstruccionTR(Instr));
 
    initial begin
        Instr = 32'h00000000; #10;
 
        Instr = 32'h02114020; #20;
        Instr = 32'h02534822; #20;
        Instr = 32'h02955024; #20;
        Instr = 32'h02D75825; #20;
        Instr = 32'h0319602A; #20;
 
        Instr = 32'h00226820; #20;
        Instr = 32'h00A37022; #20;
        Instr = 32'h00C77824; #20;
        Instr = 32'h014B4025; #20;
        Instr = 32'h007E482A; #20;
 
        #10;
        $finish;
    end
 
endmodule
 