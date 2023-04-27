# 4way-juction-traffic-light-controller


In this project, a traffic light controller is created for a four-way intersection with four total lanes, and the lights are configured so that each lane is allocated a single traffic light. I is made as a melay state machine of a finite state machine. The image below illustrates this concept in greater detail.


![image](https://user-images.githubusercontent.com/94220408/234959198-b17d672b-9ea9-4885-bae3-9982f1ebc58e.png)

## Working of the traffic contoller system


In terms of how the controller operates, at time 0 or when reset is 1, it is set up so that only lane 1's green light flashes while the signals for all other lanes are in red (this is state 1). After 40 seconds or four clock ticks, the second lane's yellow signal flashes, indicating that it is ready to move forward (this is state 2).
The second lanes green light goes high after another 20 seconds (this is the third state), the third lanes yellow light goes high after another 40 seconds (this is the fourth state), and so on for all the remaining lanes until it returns to the initial state once more, beginning the loop.


## Code functionality

The following verilog module works as follows : 
   
   1. There is a variable register called state that has 12 bits and each bit represents the signal's state (whether it is on or off), which is represented as follows:
      
      ![WhatsApp Image 2023-04-28 at 00 28 37](https://user-images.githubusercontent.com/94220408/234965013-c8001b75-d149-4b77-80cd-b505333a62a5.jpg)


   2.To make it easier to understand the output, each clock tick is thus treated as lasting 10 seconds, hence a count value is used to keep track of how many clock ticks are occurring. Then a case statement that checks the value of state at each clk pulse is inserted within the always block, which is where the code executes whenever a posege is recognised. 
   
   
   3. And at every clk pulse the value of the states are assigned to the respective outputs using vector part select consept, here is the code snippet of the same:
   
   ![image](https://user-images.githubusercontent.com/94220408/234966619-16e3ac2b-67f4-4af1-9f98-c6b8dea779ab.png)



## SUMMARY

The goal of the project is to create a real-world traffic light controller that successfully prevents accidents and makes travel much safer. However, the only drawback is that each lane must wait for at least three to four minutes before moving forward, which is a bit of a hassle in my opinion 😉. 

### THANK YOU


