`timescale 1ms / 1ns
module fourway_traficlight_countroller(clk,reset,l1,l2,l3,l4);
input clk,reset; // clk represents the time function and reset resets the hole process when it is high;
output reg [2:0]l1,l2,l3,l4; // the outputs l1,l2,l3,l4 represent the light trafic light of each lane, each bit in the 3bit vector represent l1[2]= green,l1[1]= yellow,l1[2]= red;
reg [11:0]state = 12'b100001001001; // the state is of reg type which represent the states of the lights combined making it 3x4=12 bit vector;
reg [6:0]count=7'b0000000; // count stores the value of the clk tick at an instant;
always @ (posedge clk) begin // executes the below code whenever a positive edge of the clk is sensed;
if (reset) // resets to the initial state where only the lane 1 is in green and rest all are in red;
state <= 12'b100001001001;
else begin
case (state) 

12'b100001001001 : begin
count <= count+1;                
if (count == 4)begin               //state1 : or initial state is when only lane1 is in green and all other are in red and after 40 sec it changes to state2
state <= 12'b100010001001;
count <= 0;
end
else 
state <= 12'b100001001001;
end


12'b100010001001 : begin
count <= count+1;
if (count == 2)begin
state <= 12'b001100001001;           //state2 :  lane 1:green, lane2:yellow, lane3:red , lane4:red; after 20 sec it changes to state3
count <= 0;
end
else 
state <= 12'b100010001001;
end


12'b001100001001 : begin
count <= count+1;
if (count == 4)begin
state <= 12'b001100010001;          //state3:  lane 1:red, lane2:green, lane3:red , lane4:red; after 40 sec it changes to state4
count <= 0;
end
else 
state <= 12'b001100001001;
end


12'b001100010001 : begin
count <= count+1;
if (count == 2)begin
state <= 12'b001001100001;           //state4: lane 1:red, lane2:green, lane3:yellow , lane4:red; after 20 sec it changes to state5
count <= 0;
end
else 
state <= 12'b001100010001;
end


12'b001001100001 : begin
count <= count+1;
if (count == 4)begin
state <= 12'b001001100010;           //state5: lane 1:red, lane2:red, lane3:green , lane4:red; after 40 sec it changes to state6
count <= 0;
end
else 
state <= 12'b001001100001;
end


12'b001001100010 : begin
count <= count+1;
if (count == 2)begin
state <= 12'b001001001100;           //state6: lane 1:red, lane2:red, lane3:green , lane4:yellow; after 20 sec it changes to state7
count <= 0;
end
else 
state <= 12'b001001100010;
end


12'b001001001100 : begin
count <= count+1;
if (count == 4)begin
state <= 12'b010001001100;           //state7: lane 1:red, lane2:red, lane3:red , lane4:green; after 40 sec it changes to state4
count <= 0;
end
else 
state <= 12'b001001001100;
end


12'b010001001100 : begin
count <= count+1;
if (count == 2)begin
state <= 12'b100001001001;           //state8: lane 1:yellow, lane2:red, lane3:red , lane4:red; after 20 sec it changes to the inital state and the loop continues
count <= 0;
end
else 
state <= 12'b010001001100;
end
endcase
end
l1 <= state[11:9];
l2 <= state[8:6];
l3 <= state[5:3];
l4 <= state[2:0];
end
endmodule
