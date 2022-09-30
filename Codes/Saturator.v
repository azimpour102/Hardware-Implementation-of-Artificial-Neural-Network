module Saturator#(parameter n=8)(input [15+$clog2(n):0]acc,output reg[7:0]ans);
  reg [15+$clog2(n)-9:0]_acc;
  always@(acc)begin
    _acc=acc[15+$clog2(n):9];
    if(acc>127)
      ans=8'd127;
    else
      ans=acc[7:0];
  end
endmodule