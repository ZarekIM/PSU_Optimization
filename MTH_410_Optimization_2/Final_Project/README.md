# Estimation of Distributed Source Parameters for a Nonlinear Dynamical System  
#### MTH 410 - Final Project - 3/21/2019  
  
### Problem Summary & Context  
For this project, we have a constrained optimization problem in which the constraints are given by a discretized, nonlinear Initial Boundary Value Problem (IBVP). The goal is to find the optimal source parameters vector, alpha, that approximates the data in prdata1.m at time t_100. We use prdata1.m in our optimization procedure and validate with prdata2.m. This project combines the theory and methodology used for assignment 2 (param. estimation for a nonlinear BVP) and assignment 4 (param. est. in a discrete dynamical system). Whereas those problems were 2-dimensional, this problem is in 3 dimensions- 2 spacial and 1 temporal.  
  
For the complete project instructions, please refer to [FinalProject_w2019.pdf](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/doc/FinalProject_w2019.pdf).  
  
### Approach  
Our approach will be to solve the reduced problem, expressed as follows: 
![reduced_model](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/figures/reduced_problem.PNG)    
This approach takes the posed constrained optimization problem and reduces it to an unconstrained problem by expressing **u<sub>m</sub>** in terms of the source parameters ***a***. This is significantly more efficient than the alternative (solving the full, constrained problem) as it requires much less computation. Since we're now expressing our problem as an unconstrained optimization problem, we can use the built-in matlab function, `fminunc()`, to find an optimal solution.
  
The use of the function handle `@(a)` in the line  
`[a,fval,exitflag] = fminunc(@(a) fModel(n,m,k,a,u0,A,prdata1), a0);`  
minimizes the source parameter vector, a, such that column m of the state-values matrix, u, approximates prdata1 at time t_m. We then generate the state-values for u_2m at time t_2m and compare the results to the validation data, prdata2. 
   
### Results  
![Task 1](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/figures/Task_1.PNG)
  
See [finalProj_zm.m](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/finalProj_zm.m) for the function that satisfies Task 1.  
  
![Task 2](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/figures/Task_2.PNG)  
  
Plot (Spacial Distribution) of the optimal parameter values *a**:  
![fig 1a](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/figures/final_fig_1a.png)  

Plot of the model state **u**<sub>m</sub>* fit to data prdata1.m at time *t<sub>m</sub>*:  
![fig 1b](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/figures/final_fig_1b.png)  

Value of cost function f(a*): At time t<sub>m</sub> with m=100, f(a*) = 3.6027^-5.  

*Validation procedure:*  
Plot of the model state **u**<sub>2m</sub>* fit to data prdata2.m at time<sub>2m</sub>:  
![fig 1c](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/figures/final_fig_1c.png)  
At time t<sub>m</sub> with m=200, f(a*) = 3.6208^-5. The validation procedure shows that our model approximates prdata2.m when performed with u0 = sin(2 pi x).  

![Task 3](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/figures/Task_3.PNG)  

Plot (Spacial Distribution) of the optimal parameter values *a**:  
![fig 2a](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/figures/final_fig_2a.png)  

Plot of the model state **u**<sub>m</sub>* fit to data prdata1.m at time *t<sub>m</sub>*:  
![fig 2b](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/figures/final_fig_2b.png)  

Value of cost function f(a*): At time t<sub>m</sub> with m=100, f(a*) = 3.6488^-5.  
  
*Validation procedure:*  
Plot of the model state **u**<sub>2m</sub>* fit to data prdata2.m at time *t<sub>2m</sub>*:  
![fig 2c](https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/Final_Project/figures/final_fig_2c.png)  
At time t<sub>m</sub> with m=200, f(a*) = 10.8138. The initial condition u0 = sin(pi x) results in a very poor result for the validation procedure with prdata2.
