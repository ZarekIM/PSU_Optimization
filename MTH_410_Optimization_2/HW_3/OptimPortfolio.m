% Optimal Portfolio Problem
% Zarek McGee
% 2/14/2019
% Score received: 39/40. Errors & formatting have been corrected.

function [xStar] = OptimPortfolio(m)
% --------------------------------------------------------------------------- %
% For detailed problem definition, please refer to hw3.pdf.
% For a write-up & results for this problem, please refer to the readme.md.

% INPUT: m is the number of 'l' points to test. 

% USAGE:
%	OptimPortfolio(50). Any m can be used, but higher m -> smoother curve
% --------------------------------------------------------------------------- %

	% l is the level of return
	l = linspace(1.2,2.5,m);
	Q = [1 1/3 -1/3; 1/3 2 0; -1/3 0 3];
	invQ = inv(Q);
	r = [1.1 2 3]';
	
	% Shorthand for x formula used below
	a = 0.5 * ones(1,3) * invQ * ones(3,1);
	b = 0.5 * ones(1,3) * invQ * r;
	c = 0.5 * r' * invQ * r;
	d = b^2 - a*c;
	
	% For each l, calculate a lam1 & lam2 then a 3x1 x vector
	for i=1:m
	lam1 = (b*l(i)-c)/d;
	lam2 = (b - a*l(i))/d;
	
	x = (0.5*invQ*ones(3,1)*lam1 + 0.5*invQ*r*lam2);
	
	% Sigma Squared (variance)
	sigSq(i) = x'*Q*x;
	end
	
	% Create plot of variance vs. l (top of curve is Efficient Frontier)
	plot(sigSq,l); xlabel("Variance x'Qx"); ylabel("Level of return l");
	
	% Find l value corresponding to min xQx
	min = find(sigSq==min(sigSq));
	lStar = l(min);
	lStar
	
	% Calculate Lagrange Multipliers corr. to the Optimal Portfolio Distr.
	lam1 = (b*lStar-c)/d;
	lam2 = (b - a*lStar)/d;
	
	% Optimal Portfolio Distr.
	xStar = (0.5*invQ*ones(3,1)*lam1 + 0.5*invQ*r*lam2);

end
