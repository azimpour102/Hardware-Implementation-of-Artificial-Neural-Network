module NControler#(parameter n=8)(input start,clk,rst,output reg[$clog2(n):0] cycle,output reg accr_en,ready);
  reg[32:0] cnt;
  //assign cycle=cnt;
  reg[1:0] cur,next;
  always@(posedge clk,posedge start,posedge rst)begin
    if(rst)begin
      cur<=0;
      cnt<=0; 
    end
    else if(start) begin 
      if(cur==2'b00)begin
        cur<=next;
        cnt<=0;
      end
    end
    else if(cur!=2'b00)begin
      cur<=next; 
      if(cur==2'b01)
        cnt<=cnt+1;
    end 
  end
  always@(cnt)begin
    cycle=cnt;
    if(cur==0)begin
      //cnt=0;
      next=1;
      accr_en=0;
      ready=0;
    end
    else if(cur==1)begin
      if(cnt==n)
        next=2'b10;
      else
        next=2'b01;
      accr_en=1;
      ready=0;
    end
    else if(cur==2)begin
      accr_en=0;
      ready=1;
      next=0;
    end
  end
endmodule
