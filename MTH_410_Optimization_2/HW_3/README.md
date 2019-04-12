# Optimal Portfolio Problem
#### MTH 410 - HW #3 (Problem 4) - 2/14/2019  
  
### Problem Summary & Context  
The problem is defined as follows:  
<img src="https://github.com/ZarekIM/PSU_Optimization/blob/master/MTH_410_Optimization_2/HW_3/Problem_3.PNG" width="775">  
  
The context of this problem is that we're investing in a stock portfolio (represented by x = 
x<sub>1</sub>, x<sub>2</sub>, ... , x<sub>n</sub>, where each x<sub>i</sub> is a different stock), 
and we want to find the optimal distribution of our funds based on past trends, which we define as meeting 
the given expected rate of return while minimizing variance (risk). 
  
We're given the symmetric and positive definite covariance matrix Q (note that all covariance matrices are at 
least symmetric and positive semi-definite, which is quite nice). The covariance matrix Q tells us the 
degree to which returns on assets are correlated. That is, for i =/= j,  
Q<sub>ij</sub> > 0 -> investments have a positive correlation,  
Q<sub>ij</sub> = 0 -> investments are uncorrelated,  
Q<sub>ij</sub> < 0 -> investments have a negative correlation.  
  
The first constraint equation ensures we invest exactly 100% of our funds, and the second constraint ensures 
that we meet our desired level of return l.  
  
### Approach  
To solve this problem, we use the Lagrange Multipliers approach. Using the Lagrangian function,  
<img src="https://github.com/ZarekIM/PSU_Optimization/blob/master/MTH_410_Optimization_2/HW_3/Lagrangian.PNG">
  
we find the gradient of L to obtain the first-order optimality conditions. Setting these conditions equal 
to 0 gives us a system of equations used to obtain the following equation for x,  
<img src="https://github.com/ZarekIM/PSU_Optimization/blob/master/MTH_410_Optimization_2/HW_3/equation_for_x.PNG">  

The coefficients a,b,c,d are defined in OptimPortfolio.m lines 11-14.  
  
### Results  
Running `>> OptimPortfolio(50)` gives us the following results:   
* Optimal Level of Return l* that minimizes the variance: l* = 1.7306.  
* Optimal Portfolio Distribution cooresponding to l*, x(l*) = [0.57360 0.17955 0.24685].  
* The plot of Level of Return l vs. Variance (The upper half of the curve is called the "Efficient Frontier" in finance):  
<img src="https://github.com/ZarekIM/PSU_Optimization/blob/master/MTH_410_Optimization_2/HW_3/hw3_fig_1.PNG" width="450"> 
