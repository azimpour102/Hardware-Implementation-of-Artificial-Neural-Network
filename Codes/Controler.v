module Controler#(parameter n=8)(input start,clk,rst,_ready,output reg[$clog2(n):0] count,
  output reg _start,_rst,s_i,ready,write,writeloc,output reg[1:0] s_w);
  reg[32:0] cnt;
  //assign cycle=cnt;
  reg[2:0] cur,next;
  always@(posedge clk,posedge start,posedge rst/*,posedge _ready*/)begin
    if(rst)begin
      cur<=0;
      cnt<=0;
      _rst<=1; 
    end
    else if(start) begin
      cnt<=0; 
      if(cur==3'b000)
        cur<=next;
    end
    else if(_ready)begin
      if(cur==3'b001 || cur==3'b011 || cur==3'b101)
        cur<=next;
    end
    else if(clk)begin
      if(cur==3'b010 || cur==3'b100 || cur==3'b110)
        cur<=next;
    end 
  end
  always@(*)begin
    count=cnt;
    if(cur==0)begin
      _start=0;
      _rst=1;
      next=3'b001;
    end
    else if(cur==3'b001)begin
      _start=1;
      _rst=0;
      s_i=0;
      s_w=00;
      ready=0;
      next=3'b010;
      #5 _start=0;
    end
    else if(cur==3'b010)begin
      _start=0;
      _rst=1;
      write=1;
      writeloc=0;
      next=3'b011;
    end
    else if(cur==3'b011)begin
      _start=1;
      _rst=0;
      s_i=0;
      s_w=01;
      ready=0;
      next=3'b100;
      #5 _start=0;
    end
    else if(cur==3'b100)begin
      _start=0;
      _rst=1;
      write=1;
      writeloc=1;
      next=3'b101;
    end
    else if(cur==3'b101)begin
      _start=1;
      _rst=0;
      s_i=1;
      s_w=10;
      ready=0;
      next=3'b110;
      #5 _start=0;
    end
    else if(cur==3'b110)begin
      _start=0;
      _rst=1;
      write=1;
      writeloc=1;
      ready=1;
      #10 cnt=cnt+1;
      
      if(cnt==n)
        next=3'b000;
      else
        next=3'b001;
    end
  end
endmodule
