module Softmax(input [7:0]ins0,ins1,ins2,ins3,ins4,ins5,ins6,ins7,ins8,ins9,output [3:0]w);
  wire [3:0]___w[0:5];
  wire [7:0]_ins[0:8];
  Max m0(ins0,ins1,4'd0,4'd1,___w[0],_ins[0]);
  Max m1(ins2,ins3,4'd2,4'd3,___w[1],_ins[1]);
  Max m2(ins4,ins5,4'd4,4'd5,___w[2],_ins[2]);
  Max m3(ins6,ins7,4'd6,4'd7,___w[3],_ins[3]);
  Max m4(ins8,ins9,4'd8,4'd9,___w[4],_ins[4]);
  Max m5(_ins[4],_ins[3],___w[4],___w[3],___w[5],_ins[5]);
  
  wire [3:0]__w[0:1];
  Max m6(_ins[0],_ins[1],___w[0],___w[1],__w[0],_ins[6]);
  Max m7(_ins[2],_ins[5],___w[2],___w[5],__w[1],_ins[7]);
  
  Max m8(_ins[6],_ins[7],__w[0],__w[1],w,_ins[8]);
endmodule