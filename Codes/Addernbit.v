module Addernbit#(parameter n=8)(input[15+$clog2(n):0] A,input[15+$clog2(n):0] B, output[15+$clog2(n):0] W);
  assign W=A+B;
endmodule