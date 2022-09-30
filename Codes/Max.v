module Max(input [7:0]a,b,input [3:0]ia,ib,output reg [3:0]c,output reg [7:0]d);
  always@(a,b)begin
    if(a>=b)begin
      c=ia;
      d=a;
    end
    else begin
      c=ib;
      d=b;
    end
  end
endmodule