  
 
module add1p (
	input   MSBY,
  input   MSBX,
	input   LSBY,
	input   LSBX,
  input   clk,

	output  MSBYX,
  output  LSBYX
);


logic carry, carry_delayed;
logic msb_sum, msb_sum_delayed;

assign msb_sum = MSBY + MSBX;


always_ff@(posedge clk)
     msb_sum_delayed <= msb_sum;

assign {carry,LSBYX}= LSBY + LSBX;

logic LSBYX_predelay;

always_ff@(posedge clk)
	carry_delayed <= carry;
  LSBYX         <= LSBYX_predelay;

assign MSBYX = carry_delayed + msb_sum_delayed;



