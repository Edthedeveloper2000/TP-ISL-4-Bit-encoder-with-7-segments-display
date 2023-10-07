module Display(
    input wire clock,
    input wire reset,
    input wire ready,
    input entrada,
    output reg [6:0] saida
);
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            saida = 7'b0000000;
        end
        else if (ready) begin
            #1;
            case(entrada)
                1'b0: saida = 7'b0111111;
                1'b1: saida = 7'b0000110;
                default: saida = 7'b1111111;
            endcase
        end
    end

endmodule
