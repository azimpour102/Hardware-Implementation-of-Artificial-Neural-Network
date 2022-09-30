module Reg#(parameter n=8)(input [15+$clog2(n):0]ld,input clk,en,rst,output reg [15+$clog2(n):0]w);
  always @(posedge clk,posedge rst) 
    if(rst)
      w=0;
    else if(en)
      w=ld;
endmodule