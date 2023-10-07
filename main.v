module Main(
    input wire clock,
    input wire reset,
    input wire ready,
    input wire [3:0] entrada,

    output wire [3:0] saida,
    output wire[6:0] display3,
    output wire[6:0] display2,
    output wire[6:0] display1,
    output wire[6:0] display0);

    Codificador uut (
    .clock(clock),
    .reset(reset),
    .ready(ready),
    .A(entrada[3]),
    .B(entrada[2]),
    .C(entrada[1]),
    .D(entrada[0]),
    .S3(saida[3]),
    .S2(saida[2]),
    .S1(saida[1]),
    .S0(saida[0])
    );

    Display display3_uut (.clock(clock),.reset(reset),.ready(ready),.entrada(saida[3]), .saida(display3));
    Display display2_uut (.clock(clock),.reset(reset),.ready(ready),.entrada(saida[2]), .saida(display2));
    Display display1_uut (.clock(clock),.reset(reset),.ready(ready),.entrada(saida[1]), .saida(display1));
    Display display0_uut (.clock(clock),.reset(reset),.ready(ready),.entrada(saida[0]), .saida(display0));


endmodule