module Buffer(input clk,write,writeloc, input [6:0]readloc,input [7:0]
  n1o,n2o,n3o,n4o,n5o,n6o,n7o,n8o,n9o,n10o, output reg[7:0]R);
  reg [7:0]no[0:19];
  always@(posedge clk) begin
    if(write == 1)begin
        no[writeloc*10]<=n1o;
        no[writeloc*10+1]<=n2o;
        no[writeloc*10+2]<=n3o;
        no[writeloc*10+3]<=n4o;
        no[writeloc*10+4]<=n5o;
        no[writeloc*10+5]<=n6o;
        no[writeloc*10+6]<=n7o;
        no[writeloc*10+7]<=n8o;
        no[writeloc*10+8]<=n9o;
        no[writeloc*10+9]<=n10o;
    end
  if(readloc==62)
    R<=8'd127;
  else if(readloc<62 && readloc>19)
    R<=8'b00000000;
  else
    R<=no[readloc];
  end
endmodule