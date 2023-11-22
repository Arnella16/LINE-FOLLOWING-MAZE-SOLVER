<h1>Line Following Maze Solver</h1>

<h2>Team Details</h2>
<details>
<summary>Detail</summary>
           
Semester : 3rd Sem B.Tech CSE

Section: S1

Member-1: D Jubitha Sri, 221CS120, daravathjubithasri.221cs120@nitk.edu.in

Member-2: G Teja Sri, 221CS123, tejasrigarapati.221cs123@nitk.edu.in

Member-3: S Vineela, 221CS155, sivvalavineela.221cs155@nitk.edu.in
</details>


<h2>Abstract</h2>
<details>
           <summary>
                      Detail
           </summary>
                This Line-following Maze Solver project will delve into a line-following robot's design, construction, and programming, emphasizing the key components and algorithms required for successful maze navigation.The robot system configuration consists of input, controller, and output devices.
         In a line maze-solving robot, input devices are line sensors, and output ones are DC motors with drivers. The line sensors are a crucial part of the project, making the robot move steadily in the middle position of black lines without any lag. It must make real-time decisions about its movement based on the line's position, adjusting its speed and direction. The concept behind this project is inspired by various real-world applications, such as automated warehouse robots, self-driving cars, and industrial automation systems, which rely on similar principles of path following and obstacle avoidance.It provides a platform for experimenting with robotics and sensor integration for future applications. Line-following robots are often used in educational settings to teach students about robotics, programming, and automation concepts. It offers an affordable and accessible way to prototype autonomous systems, making it valuable for research and development in various industries.
          Line-following robots are designed to follow lines accurately, making them suitable for applications where precise path following is crucial, such as manufacturing, logistics, etc. These robots can adapt to various line configurations, making them versatile for different maze designs or path-following tasks.
</details>


<h2>Working</h2>
<details>
           <summary>
                      Detail
           </summary>
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

<img width="422" alt="FUNCTIONAL TABLE" src="https://github.com/Arnella16/LINE-FOLLOWING-MAZE-SOLVER/assets/148844350/09227af1-42ae-41d6-971d-b477c2caf29e">
</details>


<h2>Logisim Circuit Diagram</h2>
<details>
           <summary>
                      Detail
           </summary>
           PRE-DEFINED PATH (MAIN)

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
</details>


<h2>Verilog Code</h2>
<details>
           <summary>
                      Detail
           </summary>
           
`````/* Line following Maze Solver using LSRB Algorithm
L-left, S-straight, R-right, B-back(turn around)

Robot follows the above given priority if a junction is detected*/

module linefollower(LSRB ,s ,straight ,stop ,left ,right ,turn_around ,left_motor_forward ,left_motor_backward ,left_motor_right ,left_motor_left ,right_motor_forward ,right_motor_backward ,right_motor_right ,right_motor_left);

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

linefollower s1(LSRB ,s ,straight , stop , left, right ,turn_around, left_motor_forward, left_motor_backward, left_motor_right, left_motor_left, right_motor_forward, right_motor_backward, right_motor_right, right_motor_left);

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
    
    /* str:straight   lf:left   rg:right   ta:turn around   lf:left_motor_forward   lb:left_motor_backward  ll:left_motor_left   lr:left_motor_right   rf:r
    ight_motor_forward   rb:right_motor_backward   rl:right_motor_left   rr:right_motor_right  */ 
    
    $display("-------------------------------------------------------------------------------------------------------------");
    
    $monitor("    %b      %b       %b       %b     |  %b    %b    %b    %b    %b   |  %b   %b   %b   %b   %b  |  %b  %b  %b  %b | %b  %b  %b  %b",
    LSRB[0],LSRB[1],LSRB[2],LSRB[3],s[0],s[1],s[2],s[3],s[4],straight,stop,left,right,turn_around,left_motor_forward,left_motor_backward,left_motor_right,left_motor_left
    ,right_motor_forward,right_motor_backward,right_motor_right,right_motor_left);
    
    LSRB=4'b0000;
    
    repeat(15)
    
    #10 LSRB=LSRB+4'b0001;
    
    $display("                                                                                                          ");
    
    $display("                                                                                                          ");
    
    $display("                                                                                                          ");
    
    $display("                                  LINE FOLLOWING MAZE SOLVER WITH PREDEFINED PATH                         ");
    
    $display("   L       S       R       B     |           Sensor         |       Direction     |     Motor direction   ");
    
    $display(" LSRB[0] LSRB[1] LSRB[2] LSRB[3] | s[0] s[1] s[2] s[3] s[4] |  str stop lf rg ta  | lf lb lr ll | rf rb rr rl");
    
    /* str:straight   lf:left   rg:right   ta:turn around   lf:left_motor_forward   lb:left_motor_backward  ll:left_motor_left   lr:left_motor_right   rf:r
    ight_motor_forward   rb:right_motor_backward   rl:right_motor_left   rr:right_motor_right  */ 
    
    $display("-------------------------------------------------------------------------------------------------------------");
    
    $monitor("    %b      %b       %b       %b     |  %b    %b    %b    %b    %b   |  %b   %b   %b   %b   %b  |  %b  %b  %b  %b | %b  %b  %b %b ",LS
    RB[0],LSRB[1],LSRB[2],LSRB[3],s[0], s[1],s[2], s[3], s[4], straight, stop, left, right, turn_around, left_motor_forward, left_motor_backward, left_motor_right, left_motor_left, right_motor_forward, right_motor_backward, right_motor_right, right_motor_left);
    
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
</details>



<h2>References</h2>
<details>
           <summary>
                      Detail
           </summary>
           
•	https://www.researchgate.net/publication/345349518_Maze_Solving_Algorithm_for_Line_Following_Robot

•	Digital Design - By Morris Mano and Michael Cilette

•	https://youtu.be/qTeGocwwGBY?si=2I423SrJmCBAfTtp // Arduino Maze Solver Robot

•	https://towardinfinity.medium.com/coding-a-line-follower-robot-using-lsrb-and-finding-the-shortest-path-d906ffec71d

•	https://github.com/doaamagdy2024/Maze-Solver-Line-follower-Robot
</details>

