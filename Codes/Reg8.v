module Reg8(input [7:0]ld,input clk,en,rst,output reg [7:0]w);
  always @(posedge clk,posedge en) 
    if(en)
      w<=ld;
    /*if(rst)
      w<=0;
    else*/ 
endmodule

