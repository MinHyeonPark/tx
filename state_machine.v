module state_machine(input clk, reset, 
           input tx_cek,
           input [11:0] count,
           input [7:0] data,
           output reg txd);


reg[3:0] state, nextstate;

parameter s0 = 4'b0000;
parameter s1 = 4'b0001;
parameter s2 = 4'b0010;
parameter s3 = 4'b0011;
parameter s4 = 4'b0100;
parameter s5 = 4'b0101;
parameter s6 = 4'b0110;
parameter s7 = 4'b0111;
parameter s8 = 4'b1000;
parameter s9 = 4'b1001;
parameter s10 = 4'b1010;



// state register
always @(posedge clk, negedge reset)
begin
     if(~reset) state <= s0;
     else state <= nextstate;
end

// next state logic
always @(*)
begin
case (state)
   s0: if (tx_cek==1) nextstate = s1;
       else nextstate = s0;

   s1: if (count==2604) nextstate = s2;
       else nextstate = s1;

   s2: if (count==2604) nextstate = s3;
       else nextstate = s2;

   s3: if (count==2604) nextstate = s4;
       else nextstate = s3;

   s4: if (count==2604) nextstate = s5;
       else nextstate = s4;

   s5: if (count==2604) nextstate = s6;
       else nextstate = s5;
   
   s6: if (count==2604) nextstate = s7;
       else nextstate = s6;
 
   s7: if (count==2604) nextstate = s8;
       else nextstate = s7;

   s8: if (count==2604) nextstate = s9;
       else nextstate = s8;

   s9: if (count==2604) nextstate = s10;
       else nextstate = s9;

   s10: if (count==2604) nextstate = s0;
       else nextstate = s10;

   default: nextstate <= s0;
endcase
end
//output logic

always @(*)
begin
case(state)
     s0: txd <= 1;
     s1: txd <= 0;
     s2: txd <= data[0];
     s3: txd <= data[1];
     s4: txd <= data[2];
     s5: txd <= data[3];
     s6: txd <= data[4];
     s7: txd <= data[5];
     s8: txd <= data[6];
     s9: txd <= data[7];
     s10: txd <= 1;
     default: txd <= 1;
endcase
end 
endmodule 
