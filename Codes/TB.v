module TB();
  reg start,clk,rst,flag;
	//reg [7:0]weights1[0:7];
	reg [7:0]inps[0:749][0:62];
	reg [7:0]_nps[0:62];
	reg [7:0]__ps;
	reg [2:0]lbls[0:749];
	wire ready;
	wire[3:0] class;
	wire[6:0] readloc;
	wire[10:0] count;
	integer i,j;
	integer corrects=0;
	FFNN#(750) ffnn(clk,rst,start,inps[count][readloc],ready,count,readloc,class);
	initial begin
	  $readmemh("test_data_sm.dat", inps);
	  $readmemh("test_lable_sm.dat", lbls);
	  
	  //_nps=inps[count];
	  //__ps=inps[count][readloc];
	  
	  // vsim -gui work.TB
	  
	  for(i=0;i<750;i=i+1)begin
	    inps[i][62]=8'd127;
	   end
	  
	  rst=1;		clk=0;  start=0;  flag=0;
	  #5 rst=0; clk=1; start=1;
	  #5 clk=0; start=0;
	  for(i=0;i<750;i=i+1)begin
	    for(j=0;j<3;j=j+1)begin
	      repeat(130) #5 clk=~clk;
	      flag=~flag;
	    end
	    if(class==lbls[i])
		    corrects=corrects+1;
		end
		$display("corrects: %f%%",corrects);
		$display("Accuracy: %f%%",100*corrects/750);
	end
endmodule
