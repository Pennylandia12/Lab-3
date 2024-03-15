module FSM (clk, reset, L, R, y);

   input logic  clk;
   input logic  reset;
   input logic 	L;
   input logic R;
   
   output logic y;

   typedef enum 	logic [1:0] {S0, S1, S2} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
	  y <= 6'b000_000;	  
	  if (R) nextstate <= S4;
    else if (L&&R) nextstate <= S7;
	  else   nextstate <= S1;
       end

    //Left Turn Signal     
       S1: begin
	  y <= 6'b001_000;	  	  
	  if (R) nextstate <= S2;
    else if (L)
    else if(L&&R)
	  else   nextstate <= S2;
       end
       S2: begin
	  y <= 6'b011_000;	  	  
	  if (a) nextstate <= S2;
	  else   nextstate <= S3;
       end 	  
	  nextstate <= S0;
        S3: begin
	  y <= 6'b111_000;	  	  
	  if (a) nextstate <= S2;
    if(L) nextstate <= 
	  else   nextstate <= S0;
       end
    
    //Right Turn Signal
        S4: begin
	  y <= 6'b000_100;	  	  
	  if (a) nextstate <= S2;
	  else   nextstate <= S5;
       end
        S5: begin
	  y <= 6'b000_110;	  	  
	  if (a) nextstate <= S2;
	  else   nextstate <= S6;
       end
        S6: begin
	  y <= 6'b011_111;	  	  
	  if (a) nextstate <= S2;
	  else   nextstate <= S7;
       end

    //Hazard Signals
        S7: begin
	  y <= 6'b001_100;	  	  
	  if (a) nextstate <= S2;
	  else   nextstate <= S8;
       end
        S8: begin
	  y <= 6'b011_110;	  	  
	  if (a) nextstate <= S2;
	  else   nextstate <= S9;
       end
        S9: begin
	  y <= 6'b111_111;	  	  
	  if (a) nextstate <= S2;
	  else   nextstate <= S0;
       end
       default: begin
	  y <= 6'000_000;
       end	 
       
     endcase
   
endmodule
