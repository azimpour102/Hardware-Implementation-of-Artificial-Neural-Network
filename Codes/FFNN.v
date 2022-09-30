module FFNN#(parameter n=8)(input clk,rst,start,input [7:0]inp,
  output ready,output[$clog2(n):0] count,output[6:0] readloc,output[3:0] class);
  wire _ready,_start,_rst,s_i,write,writeloc;
  wire[1:0] s_w;
  wire[7:0] wh1,wh11,wo1,wh2,wh12,wo2,wh3,wh13,wo3,wh4,wh14,wo4,wh5,wh15,wo5;
  wire[7:0] wh6,wh16,wo6,wh7,wh17,wo7,wh8,wh18,wo8,wh9,wh19,wo9,wh10,wh20,wo10;
  wire[7:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10;
  wire[7:0] i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,_inp;
  wire [6:0]rl[0:9];
  wire [7:0]ans[0:9];
  wire [7:0]_ans[0:9];
  wire [3:0]_cls;
  Controler#(n) C(start,clk,rst,_ready,count,_start,_rst,s_i,ready,write,writeloc,s_w);
  
  Weights W(clk,readloc,
    wh1,wh11,wo1,wh2,wh12,wo2,wh3,wh13,wo3,wh4,wh14,wo4,wh5,wh15,wo5,
    wh6,wh16,wo6,wh7,wh17,wo7,wh8,wh18,wo8,wh9,wh19,wo9,wh10,wh20,wo10);
    
  Mux2 mi1(inp,_inp,s_i,i1);
  Mux3 mw1(wh1,wh11,wo1,s_w,w1);
  Neuron#(63) n1(_start,clk,_rst,w1,i1,rl[0],ans[0],_ready);
  Reg8 r1(ans[0],clk,_ready,_rst,_ans[0]);
  
  Mux2 mi2(inp,_inp,s_i,i2);
  Mux3 mw2(wh2,wh12,wo2,s_w,w2);
  Neuron#(63) n2(_start,clk,_rst,w2,i2,rl[1],ans[1],_r);
  Reg8 r2(ans[1],clk,_ready,_rst,_ans[1]);
  
  Mux2 mi3(inp,_inp,s_i,i3);
  Mux3 mw3(wh3,wh13,wo3,s_w,w3);
  Neuron#(63) n3(_start,clk,_rst,w3,i3,rl[2],ans[2],_r);
  Reg8 r3(ans[2],clk,_ready,_rst,_ans[2]);
  
  Mux2 mi4(inp,_inp,s_i,i4);
  Mux3 mw4(wh1,wh11,wo1,s_w,w4);
  Neuron#(63) n4(_start,clk,_rst,w4,i4,rl[3],ans[3],_r);
  Reg8 r4(ans[3],clk,_ready,_rst,_ans[3]);
  
  Mux2 mi5(inp,_inp,s_i,i5);
  Mux3 mw5(wh5,wh15,wo5,s_w,w5);
  Neuron#(63) n5(_start,clk,_rst,w5,i5,rl[4],ans[4],_r);
  Reg8 r5(ans[4],clk,_ready,_rst,_ans[4]);
  
  Mux2 mi6(inp,_inp,s_i,i6);
  Mux3 mw6(wh6,wh16,wo1,s_w,w6);
  Neuron#(63) n6(_start,clk,_rst,w6,i6,rl[5],ans[5],_r);
  Reg8 r6(ans[5],clk,_ready,_rst,_ans[5]);
  
  Mux2 mi7(inp,_inp,s_i,i7);
  Mux3 mw7(wh7,wh17,wo7,s_w,w7);
  Neuron#(63) n7(_start,clk,_rst,w7,i7,rl[6],ans[6],_r);
  Reg8 r7(ans[6],clk,_ready,_rst,_ans[6]);
  
  Mux2 mi8(inp,_inp,s_i,i8);
  Mux3 mw8(wh8,wh18,wo8,s_w,w8);
  Neuron#(63) n8(_start,clk,_rst,w8,i8,rl[7],ans[7],_r);
  Reg8 r8(ans[7],clk,_ready,_rst,_ans[7]);
  
  Mux2 mi9(inp,_inp,s_i,i9);
  Mux3 mw9(wh9,wh19,wo9,s_w,w9);
  Neuron#(63) n9(_start,clk,_rst,w9,i9,rl[8],ans[8],_r);
  Reg8 r9(ans[8],clk,_ready,_rst,_ans[8]);
  
  Mux2 mi10(inp,_inp,s_i,i10);
  Mux3 mw10(wh10,wh20,wo10,s_w,w10);
  Neuron#(63) n10(_start,clk,rst,w10,i10,readloc,ans[9],_r);
  Reg8 r10(ans[9],clk,_ready,_rst,_ans[9]);
  
  Buffer buff(clk,write,writeloc,readloc,
    _ans[0],_ans[1],_ans[2],_ans[3],_ans[4],_ans[5],_ans[6],_ans[7],_ans[8],_ans[9],_inp);
    
  Softmax S(_ans[0],_ans[1],_ans[2],_ans[3],_ans[4],_ans[5],_ans[6],_ans[7],_ans[8],_ans[9],_cls);
  
  Reg4 ans_reg(_cls,clk,ready,class);
endmodule
