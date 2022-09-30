module Activator#(parameter n=8)(input [15+$clog2(n):0]acc,input ready,output reg[15+$clog2(n):0]ans);
  always@(posedge ready)begin
    if(acc[15+$clog2(n)]==0)
      ans=acc;
    else
      ans=0;
  end
endmodule