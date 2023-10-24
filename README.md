LINE FOLLOWING MAZE SOLVER

TEAM MEMBERS:
1. 221CS120, D Jubitha Sri, daravathjubithasri.221cs120@nitk.edu.in, 6300665112
2. 221CS123, G Teja Sri, tejasrigarapati.221cs123@nitk.edu.in, 9391047854 
3. 221CS155, S Vineela, sivvalavineela.221cs155@nitk.edu.in, 9014758772


ABSTRACT:
           This Line-following Maze Solver project will delve into a line-following robot's design, construction, and programming, emphasizing the key components and algorithms required for successful maze navigation.The robot system configuration consists of input, controller, and output devices.
         In a line maze-solving robot, input devices are line sensors, and output ones are DC motors with drivers. The line sensors are a crucial part of the project, making the robot move steadily in the middle position of black lines without any lag. It must make real-time decisions about its movement based on the line's position, adjusting its speed and direction. The concept behind this project is inspired by various real-world applications, such as automated warehouse robots, self-driving cars, and industrial automation systems, which rely on similar principles of path following and obstacle avoidance.It provides a platform for experimenting with robotics and sensor integration for future applications. Line-following robots are often used in educational settings to teach students about robotics, programming, and automation concepts. It offers an affordable and accessible way to prototype autonomous systems, making it valuable for research and development in various industries.
          Line-following robots are designed to follow lines accurately, making them suitable for applications where precise path following is crucial, such as manufacturing, logistics, etc. These robots can adapt to various line configurations, making them versatile for different maze designs or path-following tasks.


BRIEF DESCRIPTION:
          An LFR (line-following robot) is a clever little gadget with a silicon brain that finds its way through an arbitrary maze.  LFR is an electro-mechanical device, typically consisting of three main subsystems. They are a drive system, an array of sensors, and a control system.The drive system has a mechanical chassis, motors, gears, and wheels. The chassis is usually designed to operate like a wheelchair, with two large drive wheels on either side of a lightweight frame. 

Objectives of this project include, to create a robot that can autonomously navigate through a maze by following a designated path and to develop and fine-tune a control algorithm that can make real-time decisions based on sensor data.
        
 The chassis is built to house the motors, gear system, batteries, and circuitry, and must also be small enough to manoeuvre within the constraints of the maze.The control system is a series of circuit boards functioning as the brain of the LFR. The control system runs a maze-solving algorithm (LSRB) based on the information received by the CPU (ARDUINO BOARD) from the sensors.The final sub-system is the sensors. They report to the CPU the current state of the surroundings where the walls and paths are. These are usually infrared sensors that pick up the track's reflected light.

•	The robot typically features a wheeled or tracked chassis that can move in all directions. The chassis may also include a power source (usually batteries), wheels or tracks for mobility, and space for mounting sensors and electronics.
•	A maze is a tour puzzle in the form of a complex branching passage through which the solver must find a route.

![image](https://github.com/Arnella16/LINE-FOLLOWING-MAZE-SOLVER/assets/148844350/827cc09b-6cc5-418f-b646-1b6a8cf9f3c9)

 Sample Maze

•	Line detection sensors are installed on the robot. These sensors typically consist of infrared sensors that can distinguish between the line and the surrounding surface. These sensors emit infrared light and measure the intensity of the reflected light. This contrast in intensity helps the robot determine its position relative to the line. Line detection sensors typically provide analog or digital output. Analog sensors offer a continuous range of values, while digital sensors provide a simple "line detected" or "line not detected" binary signal.
![image](https://github.com/Arnella16/LINE-FOLLOWING-MAZE-SOLVER/assets/148844350/d5d573be-3b48-47bc-aea9-52068db29e1c)

•	 This project typically involves a microcontroller (e.g., Arduino or Raspberry Pi) that processes data from the sensors and controls the robot's movements based on the programmed algorithm. It hosts the control algorithm, which is responsible for interpreting sensor data, performing calculations, and determining actions. This algorithm may involve PID control, finite-state machines, or other custom logic to keep the robot on the line and navigate turns effectively.
•	It is hard to change the robot’s movement parameters when already implemented. The PID-based controller is made to control the motors speed. A PID Controller consists of Proportional Control, Integral Control, and Derivative Control. The Proportional control will respond proportionally to the system error. The Integral control will respond proportionally to the system’s sum of error. Meanwhile, the Derivative control will respond proportionally to the system’s error difference. A motor speed controller is designed based on this PID controller.

 Closed loop for speed controlling of robot
![image](https://github.com/Arnella16/LINE-FOLLOWING-MAZE-SOLVER/assets/148844350/44dbdf4a-f791-4692-8767-5e3ea7811d16)

•	In the above process, the algorithm calculates the error, which represents the difference between the robot's current position relative to the center of the line. This error is essential for determining how the robot should adjust its course. Using the error information, the algorithm calculates a control output. This control output typically represents the robot's speed and steering adjustments.
•	The control output is translated into motor adjustments. If the robot deviates from the line to the right, for example, the algorithm may instruct the motors to steer the robot to the left to correct its course. The robot follows the calculated motor adjustments to stay on the line. As the robot encounters intersections, turns, or obstacles, the algorithm makes decisions to handle these situations, such as making the appropriate turns based on predefined rules or detecting obstacles and taking evasive action.
WORKING:
LSRB Algorithm:
This LSRB algorithm can be simplified into these simple conditions:
•	If you can turn left then go ahead and turn left,
•	else if you can continue driving straight then drive straight,
•	else if you can turn right then turn right.
•	If you are at a dead end then turn around.
The expunction of LSRB is shown below:
L- Left
R- Right
S- Straight
B- Turning around (Back).	
The robot has to make these decisions when at an intersection. An intersection is any point on the maze where you can turn. If the robot comes across an opportunity to turn and does not turn then this is considered going straight. Each move was taken at an intersection or when turning around has to be stored.



FLOWCHART
![FLOWCHART](https://github.com/Arnella16/LINE-FOLLOWING-MAZE-SOLVER/assets/148844350/49148b35-f658-445c-b439-5b1714f0fe40)

FUNCTIONAL TABLE
      
     Sensor Input		    |	     Direction	          |     Left Motor      |     Right Motor
S0   S1    S2   S3   S4 | Str Stop Lft  Rgt Trn | fwd bwd  rgt  lft   | fwd bwd rgt  lft 
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	1	0	0	0	0	0	0	1	1	0	0	0	0	1	0	0
0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0
0	1	1	0	0	0	0	0	1	0	0	0	1	0	0	0	1	0
0	1	1	0	1	0	0	1	0	0	0	0	0	1	0	0	0	1
1	0	1	0	0	1	0	0	0	0	1	0	0	0	1	0	0	0
1	1	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	1	1	0	1	0	0	1	0	0	0	0	0	1	0	0	0	1
1	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	1	1	1	1	0	1	0	0	0	0	0	0	0	0	0	0	0

In the above functional table,
•	Sensor Input column includes S0, S1, S2, S3, S4(the five sensors used).
•	Direction column includes the direction in which the robot has to move. They are specified as Str-Straight; Stop-Stop; Lft-Left; Rgt-Right; Trn-Turn around.
•	Motor Columns include the response of motors to the particular direction. They are 
fwd-Forward; bwd-Backward; rgt- Right; lft-Left.


LOGISIM:

PRE-DEFINED PATH
![PRE-DEFINED PATH](https://github.com/Arnella16/LINE-FOLLOWING-MAZE-SOLVER/assets/148844350/851ca450-c542-4ac0-b01a-56fdfb0bf5a7)

SENSOR SYSTEM AND MOTORS
![SENSOR SYSTEM AND MOTORS](https://github.com/Arnella16/LINE-FOLLOWING-MAZE-SOLVER/assets/148844350/2d15c653-107a-45cc-ae87-545df739953e)

DRIVER SYSTEM(sensors)
![DRIVER SYSTEM(SENSORS)](https://github.com/Arnella16/LINE-FOLLOWING-MAZE-SOLVER/assets/148844350/8d49b15b-c984-4f4b-a9ec-f6a0f0bbf926)

DRIVER SYSTEM(motors)
![DRIVER SYSTEM(MOTORS)](https://github.com/Arnella16/LINE-FOLLOWING-MAZE-SOLVER/assets/148844350/5ee152d8-da38-41dc-8793-4c2a4f231aa6)

PATH GENERATOR
![PATH GENERATOR](https://github.com/Arnella16/LINE-FOLLOWING-MAZE-SOLVER/assets/148844350/4b6a228e-0881-4dd6-8145-f8df913387db)

PATH
![PATH](https://github.com/Arnella16/LINE-FOLLOWING-MAZE-SOLVER/assets/148844350/d8c47f04-78ea-4763-b33e-0d58b04c6116)

VERILOG CODE:

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


TESTBENCH:
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
    $monitor("    %b      %b       %b       %b     |  %b    %b    %b    %b    %b   |  %b   %b   %b   %b   %b  |  %b  %b  %b  %b | %b  %b  %b %b ",LSRB[0],LSRB[1],LSRB[2],LSRB[3],s[0], s[1],s[2], s[3],s[4],straight,stop,left,right,turn_around,left_motor_forward,left_motor_backward,left_motor_right,left_motor_left,right_motor_forward,right_motor_backward,right_motor_right,right_motor_left);

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


REFERENCES:
•	https://www.researchgate.net/publication/345349518_Maze_Solving_Algorithm_for_Line_Following_Robot
•	Digital Design - By Morris Mano and Michael Cilette
•	https://youtu.be/qTeGocwwGBY?si=2I423SrJmCBAfTtp // Arduino Maze Solver Robot
•	https://towardinfinity.medium.com/coding-a-line-follower-robot-using-lsrb-and-finding-the-shortest-path-d906ffec71d
•	https://github.com/doaamagdy2024/Maze-Solver-Line-follower-Robot
