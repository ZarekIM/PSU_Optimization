% Parameter Est. of a nonlinear BVP
% Zarek McGee
% 01/31/2019

% Score recieved: 46/50. Errors and formatting have been corrected.

function LMbvpOptim(n,func)
% --------------------------------------------------------------------------- %
% For detailed problem definition, please refer to hw2.pdf.
% For a write-up & results for this problem, please refer to the readme.md.

% INPUT: 
%	n: number of interior nodes
%	func: Determines equation used for data vector uBar

% NOTATION: 
%	'aStar' and 'uStar' refer to optimal parameter 'a*' and optimal vector 'u*'

% USAGE:
%	LMbvpOptim(99,1)
%	LMbvpOptim(99,2)
% --------------------------------------------------------------------------- %

	% Build uBar data vector with n interior nodes
	x= linspace(0,1,n+2);
	uBar = zeros([n,1]);
	for i=1:n
		if func==1
			uBar(i)= sin(pi*x(i));
		elseif func==2
			uBar(i)= sin(2*pi*x(i))^2;
		end
	end
	
	% Initialize vector U which stores u, lam, and a initialized as 0s
	U = zeros(2*n+1,1);
	
	% Solve the system of 2*n+1 equations generated in gradL
	[U,fval,exitflag] = fsolve(@(U) gradL(U,n,func,uBar),U)
	
	% Output results
	[uStar,lamStar,aStar,FStar] = printResults(U,n,uBar);
	
	% Plot of data function uBar vs. uStar
	figure(1);
	plot(uBar); xlabel("x");
	hold on
	plot(uStar); legend("uBar","uStar");
	
	% Plot of lamStar
	figure(2);
	plot(U(n+1:2*n)); xlabel("x"); legend("Lagrange Multipliers");

end


function [F,x,uBar] = gradL(U,n,func,uBar)

	% Create the tridiagonal matrix A
	A = full(gallery('tridiag',n,-1,2,-1));
	h = (n+1)^2; A = A*h;
	
	% Partition U vector for use below
	u = U(1:n);
	lam = U(n+1:2*n);
	a = U(2*n+1);
	
	% System of equations given by gradient of Lagrangian function
	F = zeros(2*n+1,1);
	F(1:n) = u - uBar - A*lam - 3* diag(lam)*u.^2; % grad L w.r.t. u
	F(n+1:2*n) = -A*u - u.^3 + a*ones(n,1);        % grad L w.r.t. lam
	F(2*n+1) = lam' * ones(n,1);                   % grad L w.r.t. a

end


function [uStar,lamStar,aStar,FStar] = printResults(U,n,uBar)
	% Optimal solution vector
	uStar = U(1:n);
	
	% Vector of optimal Lagrange Multipliers
	lamStar = U(n+1:2*n);
	
	% a* is the optimal parameter corr. to u*
	aStar = U(2*n+1);
	
	% f(uStar,aStar)
	FStar = 0.5*norm(uStar - uBar)^2; 
	
	uStar,lamStar,aStar,FStar
end
