# Estimation of Distributed Source Parameters for a Nonlinear Dynamical System  
#### MTH 410 - Final Project - 3/21/2019  
  
Score recieved: 100/100.  
  
### Problem Summary & Context  
For this project, we have a constrained optimization problem in which the constraints are given by a discretized, nonlinear Initial Boundary Value Problem (IBVP). The goal is to find the optimal source parameters vector, alpha, that approximates the data in prdata1.m at time t_100. We use prdata1.m in our optimization procedure and validate with prdata2.m. This project combines the theory and methodology used for assignment 2 (param. estimation for a nonlinear BVP) and assignment 4 (param. est. in a discrete dynamical system). Whereas those problems were 2-dimensional, this problem is in 3 dimensions- 2 spacial and 1 temporal.  
  
For the complete project instructions, please refer to [FinalProject_w2019.pdf](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/doc/FinalProject_w2019.pdf).  
  
### Approach  
Our approach will be to solve the reduced problem, expressed as follows: 
***embed reduced_model.png***.  
This approach is significantly more efficient than the alternative (solving the full, constrained problem) as it requires much less computation.  
In my code, the use of the function handle `@(a)` in the line `[a,fval,exitflag] = fminunc(@(a) fModel(n,m,k,a,u0,A,prdata1), a0);` minimizes the source parameter vector, a, such that column m of the state-values matrix, u, approximates prdata1 at time t_m. We then generate the state-values for u_2m at time t_2m and compare the results to the validation data, prdata2. 

### Results  
