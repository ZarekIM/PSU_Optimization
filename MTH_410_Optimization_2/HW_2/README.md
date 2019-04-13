# Parameter Estimation for a Nonlinear Boundary Value Problem (BVP)  
#### MTH 410 - HW #2 - 1/31/2019  
  
### Problem Summary & Approach  
The goal of this problem is to return the optimal parameter a* and the cooresponding solution vector u*(x) that approximates a given "goal" function uBar(x). To obtain the solution, we rephrase the BVP as constraints for an optimization problem minimizing the function f(u,a) = 0.5 * ||u - uBar||^2. Thus, the solution will result in the optimal a* and u*(x) we seek to approximate uBar(x).  
    
For the complete problem explanation, please refer to hw2.pdf.  
  
Our approach to this problem utilizes the Lagrange Multipliers theorem which allows us to obtain a solution without explicitly solving the constraint equations. The application of this is very powerful as it allows us to approximate solutions to very computationally expensive/ difficult problems.  
  
For this problem, I've computed the first-order optimality conditions as follows:  
<img src="https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/HW_2/hw2_eq_1.PNG" width="750">
  
### Results  
Running LMbvpOptim(99,1) gives the following plots of the approximation uStar & corresponding Lagrange multipliers:  
<img src="https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/HW_2/hw2_fig_1a.PNG" width="425">
<img src="https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/HW_2/hw2_fig_1b.PNG" width="425">
  
Running LMbvpOptim(99,2) gives the following plots of the approximation uStar & corresponding Lagrange multipliers:  
<img src="https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/HW_2/hw2_fig_2a.PNG" width="425">
<img src="https://github.com/ZarekIM/PSU_Projects/blob/master/MTH_410_Optimization_2/HW_2/hw2_fig_2b.PNG" width="425">
  
#### Interpretation of Lagrange Multiplier graphs:  
Sensitivity analysis tells us that the Lagrange Multipliers indicate the rate of change of the optimal cost function f(x*) with respect to the constraint function set equal to 0. They are essentially small weights on the constraint function such that the Lagrangian function is minimized.
