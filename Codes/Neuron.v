module Neuron#(parameter n=8)(input start,clk,rst,input [7:0]weigth,inp,output[$clog2(n):0] readloc,output [7:0]ans,output ready);
  NControler #(n) ctrl(start,clk,rst,readloc,accr_en,ready);
  wire [15:0]pre_term;
  wire [15+$clog2(n):0]_cur_ans,cur_ans,new_ans,_ans,term;
  Multi8bit mult(weigth,inp,pre_term);
  Negative16bit #(n) negt(pre_term,term);
  Addernbit #(n) addr(term,cur_ans,new_ans);
  Reg #(n) accr(new_ans,clk,accr_en,start,cur_ans);
  assign _cur_ans=cur_ans/512;
  Activator #(n) actr(_cur_ans,ready,_ans);
  Saturator #(n) satr(_ans,ans);
endmodule