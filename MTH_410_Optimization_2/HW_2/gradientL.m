function [F,x,uBar] = gradientL(U)
% This function takes as input U, defined in LMbvpOptim.m	

func =2; % 1 or 2. Determines which uBar function is used below
n = 99;  % nodes in linspace between [0,1]

x= linspace(0,1,n);

% Build uBar data vector
uBar = zeros([n,1]);
for i=1:n
	if func==1
		uBar(i)= sin(pi*x(i));
	elseif func==2
		uBar(i)= sin(pi*x(i))^2;
	end
end

% Build A matrix
A = zeros(n);
for i=1:n	
	A(i,i) = 2;	
	if i==n
		break;
	end
	A(i,i+1) = -1;
	A(i+1,i) = -1;
end
h = (n+1)^2; A = A*h;

% Split up U vector for use below
u = U(1:n);
lam = U(n+1:2*n);
a = U(2*n+1);

% System of equations given by gradient of Lagrangian
F = zeros(2*n+1,1);
F(1:n) = u - uBar - A*lam - 3* diag(lam)*u.^2; % grad L w.r.t. u
F(n+1:2*n) = -A*u - u.^3 + a*ones(n,1);        % grad L w.r.t. lam
F(2*n+1) = lam' * ones(n,1);                   % grad L w.r.t. a

end