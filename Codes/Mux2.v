module Mux2(input[7:0] a,b,input s,output [7:0]w);
  assign w=s?b:a;
endmodule