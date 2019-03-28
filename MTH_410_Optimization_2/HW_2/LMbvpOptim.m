function LMbvpOptim()

n=99;
U = zeros(2*n+1,1);

[F,x,uBar] = gradientL(U);
[U,fval,exitflag] = fsolve(@gradientL,U)

% Optimal solution vector
uStar = U(1:n);
uStar

% a*; optimal parameter corr. to uStar
aStar = U(2*n+1); 
aStar

% f(uStar,aStar)
Fstar = 0.5*norm(uStar - uBar)^2; 
Fstar

% optimal Lagrange Multiplier vector
lamStar = U(n+1:2*n);
lamStar
% Plot of data function (uBar) vs. uStar
figure(1);
plot(x, uBar); xlabel("x");
hold on
plot(x,uStar); legend("uBar","uStar");

% Plot of lamStar
figure(2);
plot(x,U(n+1:2*n)); xlabel("x"); legend("Lagrange Multipliers");

end



