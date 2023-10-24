`include "project.v"
module linefollower_tb;
reg [0:3] LSRB;
wire [0:4] s;
wire straight,stop,left,right,turn_around;
wire left_motor_forward,left_motor_backward,left_motor_right,left_motor_left;
wire right_motor_forward,right_motor_backward,right_motor_right,right_motor_left;
linefollower s1(LSRB,s,straight,stop,left,right,turn_around,left_motor_forward,left_motor_backward,left_motor_right,left_motor_left,right_motor_forward,right_motor_backward,right_motor_right,right_motor_left);

initial begin
    $dumpfile("linefollower.vcd");
    $dumpvars(0,linefollower_tb);
end

initial begin
    $display("                                                                                                          ");
    $display("                                                                                                          ");
    $display("                                           LINE FOLLOWING MAZE SOLVER                                     ");
    $display("   L       S       R       B     |           Sensor         |       Direction     |     Motor direction   ");
    $display(" LSRB[0] LSRB[1] LSRB[2] LSRB[3] | s[0] s[1] s[2] s[3] s[4] |  str stop lf rg ta  | lf lb lr ll | rf rb rr rl");
    /* str:straight   lf:left   rg:right   ta:turn around   lf:left_motor_forward   lb:left_motor_backward  ll:left_motor_left   lr:left_motor_right   rf:right_motor_forward   rb:right_motor_backward   rl:right_motor_left   rr:right_motor_right  */ 
    $display("-------------------------------------------------------------------------------------------------------------");
    $monitor("    %b      %b       %b       %b     |  %b    %b    %b    %b    %b   |  %b   %b   %b   %b   %b  |  %b  %b  %b  %b | %b  %b  %b  %b",LSRB[0],LSRB[1],LSRB[2],LSRB[3],s[0],s[1],s[2],s[3],s[4],straight,stop,left,right,turn_around,left_motor_forward,left_motor_backward,left_motor_right,left_motor_left,right_motor_forward,right_motor_backward,right_motor_right,right_motor_left);
    LSRB=4'b0000;
    repeat(15)
    #10 LSRB=LSRB+4'b0001;
    $display("                                                                                                          ");
    $display("                                                                                                          ");
    $display("                                                                                                          ");
    $display("                                  LINE FOLLOWING MAZE SOLVER WITH PREDEFINED PATH                         ");
    $display("   L       S       R       B     |           Sensor         |       Direction     |     Motor direction   ");
    $display(" LSRB[0] LSRB[1] LSRB[2] LSRB[3] | s[0] s[1] s[2] s[3] s[4] |  str stop lf rg ta  | lf lb lr ll | rf rb rr rl");
    /* str:straight   lf:left   rg:right   ta:turn around   lf:left_motor_forward   lb:left_motor_backward  ll:left_motor_left   lr:left_motor_right   rf:right_motor_forward   rb:right_motor_backward   rl:right_motor_left   rr:right_motor_right  */ 
    $display("-------------------------------------------------------------------------------------------------------------");
    $monitor("    %b      %b       %b       %b     |  %b    %b    %b    %b    %b   |  %b   %b   %b   %b   %b  |  %b  %b  %b  %b | %b  %b  %b  %b",LSRB[0],LSRB[1],LSRB[2],LSRB[3],s[0],s[1],s[2],s[3],s[4],straight,stop,left,right,turn_around,left_motor_forward,left_motor_backward,left_motor_right,left_motor_left,right_motor_forward,right_motor_backward,right_motor_right,right_motor_left);
    LSRB[0]=0;LSRB[1]=1;LSRB[2]=0;LSRB[3]=0;
    #10 LSRB[0]=1;LSRB[1]=0;LSRB[2]=0;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=1;LSRB[2]=0;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=0;LSRB[2]=1;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=1;LSRB[2]=0;LSRB[3]=1;
    #10 LSRB[0]=1;LSRB[1]=0;LSRB[2]=0;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=1;LSRB[2]=0;LSRB[3]=1;
    #10 LSRB[0]=1;LSRB[1]=0;LSRB[2]=1;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=1;LSRB[2]=0;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=0;LSRB[2]=0;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=1;LSRB[2]=1;LSRB[3]=1;
    #10 LSRB[0]=1;LSRB[1]=0;LSRB[2]=1;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=1;LSRB[2]=1;LSRB[3]=1;
    #10 LSRB[0]=1;LSRB[1]=0;LSRB[2]=1;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=1;LSRB[2]=0;LSRB[3]=1;
    #10 LSRB[0]=1;LSRB[1]=1;LSRB[2]=0;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=1;LSRB[2]=0;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=0;LSRB[2]=1;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=1;LSRB[2]=0;LSRB[3]=1;
    #10 LSRB[0]=0;LSRB[1]=0;LSRB[2]=0;LSRB[3]=0;
end

initial #500 $finish;
endmodule