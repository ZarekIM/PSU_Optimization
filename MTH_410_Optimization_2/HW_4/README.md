# Parameter Estimation in a Discrete Dynamical System
#### MTH 410 - HW #4 - 2/14/2019  
  
### Problem Summary & Context  
Given the discretized form for a logistic population growth model ***embed equation img***  
with an initial state specified, we want to find the optimal control parameter p that approximates the data vector 
yBar<sub>m</sub> at the final state of the system x<sub>m</sub>.  
This problem can be solved by forming an optimization problem in which the Logistic pop. model IVP act as 
constraints for the cost functional f(x,p) = 0.5 * (x<sub>m</sub> - yBar<sub>m</sub>)<sup>2</sup> .  
  
### Results  


