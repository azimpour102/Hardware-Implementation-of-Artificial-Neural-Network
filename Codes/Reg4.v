module Reg4(input [3:0]ld,input clk,en,output reg [3:0]w);
  always @(posedge clk,posedge en) 
    if(en)
      w<=ld;
    /*if(rst)
      w<=0;
    else*/ 
endmodule