
module testbench;

reg clock;
reg reset;
reg ready;
reg [3:0] entrada;
wire [3:0] saida;

reg [3:0] contador;

wire[6:0] display3;

wire[6:0] display2;

wire[6:0] display1;

wire[6:0] display0;

Main uut (
    .clock(clock),
    .reset(reset),
    .ready(ready),
    .entrada(entrada),
    .saida(saida),
    .display3(display3),
    .display2(display2),
    .display1(display1),
    .display0(display0)
);


always begin
    #5 clock = !clock;
end

initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0, testbench);
    $display("Main:");
    $display("A B C D | S3 S2 S1 S0 |> Number3 Number2 Number1 Number0");
    $display("--------------------------------------------------------");
    
    clock = 0;
    reset = 1;
    ready = 0;
    contador = 4'b0000;

    repeat (16) begin
        entrada = contador;
        reset = 0;
        ready = 1;
        #10;
        ready = 0;
        #10;

       $display("%b %b %b %b | %b  %b  %b  %b  |> %b %b %b %b", 
       entrada[3], entrada[2], entrada[1], entrada[0], saida[3], 
       saida[2], saida[1], saida[0], display3, display2, display1, display0);

        contador = contador + 1;
    end

    $finish;
end

endmodule
