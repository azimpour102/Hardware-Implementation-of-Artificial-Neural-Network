module Weights(input clk,input [6:0]readloc,output[7:0]
  wh1,wh11,wo1,wh2,wh12,wo2,wh3,wh13,wo3,wh4,wh14,wo4,wh5,wh15,wo5,
  wh6,wh16,wo6,wh7,wh17,wo7,wh8,wh18,wo8,wh9,wh19,wo9,wh10,wh20,wo10);
  reg [7:0]wh[0:62][0:19];
  reg [7:0]wo[0:62][0:9];
  reg [7:0]bh[0:19];
  reg [7:0]bo[0:9];
  integer i,j;
  initial begin
    $readmemh("wh_sm.dat", wh);
    $readmemh("wo_sm.dat", wo);
    $readmemh("bh_sm.dat", bh);
    $readmemh("bo_sm.dat", bo);
    for(i=20;i<62;i=i+1)begin
      for(j=0;j<10;j=j+1)begin
        wo[i][j]=8'b0;
      end
    end
    for(j=0;j<20;j=j+1)begin
        wh[62][j]=bh[j];
        if(j<10)
          wo[62][j]=bo[j];
    end
  end
  assign wh1=wh[readloc][0]; assign wh11=wh[readloc][10]; assign wo1=wo[readloc][0];
  assign wh2=wh[readloc][1]; assign wh12=wh[readloc][11]; assign wo2=wo[readloc][1];
  assign wh3=wh[readloc][2]; assign wh13=wh[readloc][12]; assign wo3=wo[readloc][2];
  assign wh4=wh[readloc][3]; assign wh14=wh[readloc][13]; assign wo4=wo[readloc][3];
  assign wh5=wh[readloc][4]; assign wh15=wh[readloc][14]; assign wo5=wo[readloc][4];
  assign wh6=wh[readloc][5]; assign wh16=wh[readloc][15]; assign wo6=wo[readloc][5];
  assign wh7=wh[readloc][6]; assign wh17=wh[readloc][16]; assign wo7=wo[readloc][6];
  assign wh8=wh[readloc][7]; assign wh18=wh[readloc][17]; assign wo8=wo[readloc][7];
  assign wh9=wh[readloc][8]; assign wh19=wh[readloc][18]; assign wo9=wo[readloc][8];
  assign wh10=wh[readloc][9]; assign wh20=wh[readloc][19]; assign wo10=wo[readloc][9];
endmodule