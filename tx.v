module tx(input clk, reset,
           input tx_en,
           input [7:0]data,
           output txd);

wire tx_cek;
wire [11:0]count;

control dut(clk, reset, tx_cek, count);
shift dut2(clk, reset, tx_en, tx_cek);
state_machine dut3(clk, reset, tx_cek, count, data, txd);

endmodule 
