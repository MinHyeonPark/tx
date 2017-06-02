module shift(input clk,
                  input reset,
                  input tx_en,
                  output reg tx_cek);

reg [1:0] state, next;
parameter st0 = 2'b00;
parameter st1 = 2'b01;
parameter st2 = 2'b10;



always @(posedge clk or negedge reset)
begin
       if(~reset) state <= st0;
       else state <= next;
end

always @(*)
begin
 case(state)
 
      st0: if(tx_en) next <= st0;
           else next <= st1;
      st1: if(tx_en) next <= st0;
           else next <= st2;
      st2: if(tx_en) next <= st0;
           else next <= st2;
      default: next <= st0;
endcase
end

always @(*)
begin 
      if(state == st1) tx_cek <= 1;
      else tx_cek <= 0;
end

endmodule 
