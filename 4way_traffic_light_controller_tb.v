`timescale 1ns / 1ps

module fourway_contorller_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [2:0] l1;
	wire [2:0] l2;
	wire [2:0] l3;
	wire [2:0] l4;

	// Instantiate the Unit Under Test (UUT)
	fourway_traficlight_countroller uut (
		.clk(clk), 
		.reset(reset), 
		.l1(l1), 
		.l2(l2), 
		.l3(l3), 
		.l4(l4)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
      reset = 1; #5
		reset = 0; #340
		reset = 1; #5
		reset = 0;

	end
  always #5 clk = ~clk;     
endmodule

