% Parameter Estimation in a Discrete Dynamical System
% Zarek McGee
% 3/04/2019

% Score received: 45/50. Errors & formatting have been corrected.

function optimP(x0,ym,m,h)
% --------------------------------------------------------------------------- %
% For detailed problem definition, please refer to hw4.pdf.
% For a write-up & results for this problem, please refer to the readme.md.

% INPUT:
% 	 x0: initial value of x
% 	 ym: target data vector
% 	 m: time state of the model
%  	 h: time step

% Usage:
%	optimP(2,0.5,100,0.01) for Task 3 (i)
%	optimP(0.5,2,100,0.01) for Task 3 (ii)
% --------------------------------------------------------------------------- %

	% Returns optimal parameter p*
	[p,fval,exitflag] = fsolve(@(p) costF(x0,p,ym,m,h),-1.2);
	
	% Forward integration to get x using optimal p*
	x = xModel(x0,p,m,h);
	
	% Backward integration to get lam using optimal p*
	lam = lambdas(x,p,ym,m,h);
	
	% mu = dF/dp [ F(x0,p) ]
	% For j=m:-1:1, mu = mu + h * lam(j). Equivilently:
	mu = h* sum(lam);
	
	% Compute value of the optimized func
	f = fmin(x,ym);
	
	% Plot results
	figure(1); 
	plot(x); title('Plot of State Values');
	xlabel('model state'); ylabel('x value');
	
	figure(2); 
	plot(lam); title('Plot of Lagrange Multipliers');
	xlabel('model state'); ylabel('Lagrange Multiplier');
	
	% Print results
	x, lam, p, f, mu

end

	
%System of equations given by x(j) = Model_j-1(x_j-1)
function [x] = xModel(x0,p,m,h)

	% Initialize x vector
	x = zeros(m+1,1); x(1) = x0;
	
	% System of equations of p and x
	for j=2:m+1
		x(j) = x(j-1) + h*( x(j-1)*(1 - x(j-1)) + p );
	end

end


function [lam] = lambdas(x,p,ym,m,h)
	
	% Initialize Lagrange Multiplier vector
	lam = zeros(m,1);
	
	% Backwards integration from lam_m -> lam_0
	lam(m) = x(m+1) - ym;
	for j=m-1:-1:1
		lam(j) = lam(j+1)*(1 + h - 2*h*x(j));	
	end

end


% Reduced cost function, F(x0,p), with constant params m & h
% Note that gradient F = [lam(1); mu]
function mu = costF(x0,p,ym,m,h)

	x = xModel(x0,p,m,h);
	lam = lambdas(x,p,ym,m,h);
	mu = h * sum(lam);
	
end


% Optimization func
function f = fmin(x,ym)
	
	f = 0.5*(x(end) - ym)^2;

end

