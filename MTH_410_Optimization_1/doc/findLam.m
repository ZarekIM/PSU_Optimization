function findLam(DMat)

%OBJECTS:
%	AMat: Blurring proceduce applied to clear dollar
%	DMat: dollarblur
%	dtild: column of dollarblur
%	XMat: reconstructed dollar
%	xtild_lam: column of XMat
%	Lambdas: Array of "guesses" for suitable lambda

% Generate Matrix A (A=B^25)
AMat = AMatrix();

Lambdas = logspace(-7,1);
Lambdas

k = length(Lambdas);

for n = 1:k
	
	for i = 1:500
		
		% 220x1 column i of the noisy data matrix DMat	
		dtild = DMat(:,i);
		
		xtild_lam = (AMat' * AMat + Lambdas(n)^2 * eye(220)) \ (AMat' * dtild);
		
		%generate approx of clear dollar
		XMat(:,i)= xtild_lam;
	end

drawnow(); %I'm using Octave GUI, so this line needed to refresh figure
imagesc(XMat); colormap('gray'); title(Lambdas(n));

end


endfunction

function [AMat] = AMatrix()

% B is the descretization of the heat equation	
B = zeros(220);
L = 0.45;
	for i = 1:220
		B(i,i) = 1 - 2*L;
    	if i == 220
       		break;
		end
    	B(i, i+1) = L;
    	B(i+1, i) = L;
	end
AMat = B^25;
end