module Mux3(input[7:0] a,b,c,input[1:0] s,output reg[7:0]w);
  always@(a,b,c)begin
    if(s==2'b00)
      w=a;
    else if(s==2'b01)
      w=b;
    else
      w=c;
  end 
endmodule