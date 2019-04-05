# Optimal Portfolio Problem
#### MTH 410 - HW #3 (Problem 4) - 2/14/2019  
  
### Problem Summary & Context  
The problem is defined as follows:  
***embed Problem_3.PNG ***  
  
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
*** embed Lagrangian.PNG ***  
  
we find the gradient of L to obtain the first-order optimality conditions. Setting these conditions equal 
to 0 gives us a system of equations used to obtain the following equation for x, ***embed eq_for_x.PNG ***  
  
The coefficients a,b,c,d are defined in OptimPortfolio.m lines 11-14.  
  
### Results  
Running OptimPortfolio(50) gives us the following results:  
- The optimal 
