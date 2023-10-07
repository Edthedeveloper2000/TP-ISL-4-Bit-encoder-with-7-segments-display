module Codificador(
    input wire clock,
    input wire reset,
    input wire ready,
    
    input wire A,
    input wire B,
    input wire C,
    input wire D,

    output wire S3,
    output wire S2,
    output wire S1,
    output wire S0
);

reg S3_reg, S2_reg, S1_reg, S0_reg;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        S3_reg <= 0;
        S2_reg <= 0;
        S1_reg <= 0;
        S0_reg <= 0;
    end else if (ready) begin
        S3_reg <= (A & B & C) | (A & !B & !C) | (!A & C & D) | (!A & !B & D) | (!A & B & !C & !D);
        S2_reg <= (B & C & !D) | (A & !B & D) | (!A & B & D) | (!A & C & D) | (!A & !B & !C & !D);
        S1_reg <= (!C & D) | (!B & D) | (!A & B & !C) | (A & !B & C);
        S0_reg <= (A & !B) | (!B & !D) | (!A & !C & !D) | (A & C & !D);
    end
end

assign S3 = S3_reg;
assign S2 = S2_reg;
assign S1 = S1_reg;
assign S0 = S0_reg;

endmodule
