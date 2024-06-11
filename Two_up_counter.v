module Two_up_counter(
   input wire clock,
   input wire reset, 
    output reg [6:0]seg1,
 output reg [6:0]seg2, 
 reg [3:0]count1,
 reg [3:0]count2
    );

always @ (posedge clock or posedge reset)
 begin       
  if (reset==1) begin
   count1 <= 4'd0;
   count2 <=4'd0;
  end
    if (count1==4'd9) begin //x9 reached
    count1 <= 0;
     if (count2 == 4'd9) //99 reached
      count2 <= 0;
      else
       count2 <= count2 + 1;
   end
   else
    count1 <= count1 + 1;
    end
    always @(posedge clock)  
  begin
 

 case(count1)	 abcdefg
 0 : seg1 = 7'b1111110;
            1 : seg1= 7'b0110000;
            2 : seg1 = 7'b1101101;
            3 : seg1 = 7'b1111001;
            4 : seg1 = 7'b0110011;
            5 : seg1 = 7'b1011011;
            6 : seg1 = 7'b1011111;
            7 : seg1 = 7'b1110000;
            8 : seg1 = 7'b1111111;
            9 : seg1 = 7'b1111011;  
   endcase
   
case(count2)
     0 : seg2 = 7'b1111110;
            1 : seg2= 7'b0110000;
            2 : seg2 = 7'b1101101;
            3 : seg2 = 7'b1111001;
            4 : seg2 = 7'b0110011;
            5 : seg2 = 7'b1011011;
            6 : seg2 = 7'b1011111;
            7 : seg2 = 7'b1110000;
            8 : seg2 = 7'b1111111;
            9 : seg2 = 7'b1111011;  
endcase
end   
endmodule

module Two_up_counter_TB;
  reg clock,reset;
  reg [6:0] seg1;
  reg [6:0] seg2;
  wire [3:0] count1; 
  wire [3:0] count2;
 Two_up_counter uut(.clock(clock),.reset(reset),.seg1(seg1),.seg2(seg2),.count1(count1),.count2(count2));
  initial begin clock = 1'b0; repeat(30) #3 clock= ~clock;end
  initial begin reset=1'b1 ;#7 reset=1'b0; #35 reset=1'b1;end
  initial begin $monitor("time=%0d,reset=%b,seg1=%b,seg2=%b,count1=%b,count2=%b",$time,reset,seg1,seg2,count1,count2);end 
   endmodule

