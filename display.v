module Display(
    input entrada,
    output reg [6:0] saida
);
    
    always @* begin
        case(entrada)
            1'b0: saida = 7'b0111111;
            1'b1: saida = 7'b0000110;
            default: saida = 7'b1111111;
        endcase
    end

endmodule
