/* Line following Maze Solver using LSRB Algorithm
L-left, S-straight, R-right, B-back(turn around)
Robot follows the above given priority if a junction is detected*/
module linefollower(LSRB,s,straight,stop,left,right,turn_around,left_motor_forward,left_motor_backward,left_motor_right,left_motor_left,right_motor_forward,right_motor_backward,right_motor_right,right_motor_left);
input [0:3] LSRB; // Next move input
output [0:4] s; // 5-Sensors
output straight; // Move forward
output stop; // Stop
output left; // Turn left
output right; // Turn right
output turn_around; // Turn around
output reg left_motor_forward,left_motor_backward,left_motor_right,left_motor_left; // Specifies the direction of left motor
output reg right_motor_forward,right_motor_backward,right_motor_right,right_motor_left; // Specifies the direction of right motor

//data flow modelling
assign s[0]=(~LSRB[0]&LSRB[1])|(~LSRB[0]&~LSRB[2]&~LSRB[3]);
assign s[1]=(~LSRB[0]&~LSRB[1]&LSRB[2])|(~LSRB[0]&~LSRB[1]&~LSRB[3]);
assign s[3]=(~LSRB[0]&~LSRB[1]&~LSRB[2]&~LSRB[3]);
assign s[4]=LSRB[0]|(~LSRB[1]&~LSRB[2]&~LSRB[3]);
assign s[2]=s[0]|s[1]|s[3]|s[4]|LSRB[3];

assign straight = s[0]&s[2]&~s[3]&~s[4];
assign stop = s[0]&s[1]&s[2]&s[3]&s[4];
assign left = s[2]&~s[3]&s[4];
assign right = ~s[0]&s[1]&s[2]&~s[3]&~s[4];
assign turn_around = s[2]&~s[0]&~s[1]&~s[3]&~s[4];

//behavioural modelling
always @(*)
begin
    if(stop && !straight && !left && !right && !turn_around) begin
        left_motor_forward=1'b0; // Stop if destination is reached
        left_motor_backward=1'b0;
        left_motor_left=1'b0;
        left_motor_right=1'b0;
        right_motor_forward=1'b0;
        right_motor_backward=1'b0;
        right_motor_left=1'b0;
        right_motor_right=1'b0;
    end
    else if(straight && !stop && !left && !right && !turn_around) begin
        left_motor_forward=1'b1; // Move forward
        left_motor_backward=1'b0;
        left_motor_left=1'b0;
        left_motor_right=1'b0;
        right_motor_forward=1'b1;
        right_motor_backward=1'b0;
        right_motor_left=1'b0;
        right_motor_right=1'b0;
    end
    else if(left && !straight && !stop && !right && !turn_around) begin
        left_motor_forward=1'b0; // Turn left
        left_motor_backward=1'b0;
        left_motor_left=1'b1;
        left_motor_right=1'b0;
        right_motor_forward=1'b0;
        right_motor_backward=1'b0;
        right_motor_left=1'b1;
        right_motor_right=1'b0;
    end
    else if(right && !straight && !stop && !left && !turn_around) begin
        left_motor_forward=1'b0; // Turn right
        left_motor_backward=1'b0;
        left_motor_left=1'b0;
        left_motor_right=1'b1;
        right_motor_forward=1'b0;
        right_motor_backward=1'b0;
        right_motor_left=1'b0;
        right_motor_right=1'b1;
    end
    else if(turn_around && !straight && !stop && !left && !right) begin
        left_motor_forward=1'b1; // Turn around in clockwise direction if dead end is detected
        left_motor_backward=1'b0;
        left_motor_left=1'b0;
        left_motor_right=1'b0;
        right_motor_forward=1'b0;
        right_motor_backward=1'b1;
        right_motor_left=1'b0;
        right_motor_right=1'b0;
    end 
    else begin
        left_motor_forward=1'b0; 
        left_motor_backward=1'b0;
        left_motor_left=1'b0;
        left_motor_right=1'b0;
        right_motor_forward=1'b0;
        right_motor_backward=1'b0;
        right_motor_left=1'b0;
        right_motor_right=1'b0;
    end
end
endmodule