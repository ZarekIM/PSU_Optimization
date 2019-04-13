function XMat = McGee_MTH410Final(DMat)

% INPUT: 
% 	DMat: Noisy image dollarblur.m

% OUTPUT:
% 	XMat: Approx. of clear dollar image

% OTHER VARIABLES:
% 	dtild: columns of DMat
%	xtild_lam: columns of XMat
% 	lam: Lambda, determined by observing output on findLam.m
% 	AMat: Blurring process applied to original image

% Load blurry dollar
figure (1);
load dollarblur.m; imagesc(dollarblur); colormap('gray');


% Generate Matrix A (A=B^25)
AMat = AMatrix();


for i = 1:500
	
	% 220x1 column i of the noisy data matrix DMat	
	dtild = DMat(:,i);

	lam = 1.325711e-5;

	xtild_lam = (AMat' * AMat + lam^2 * eye(220)) \ (AMat' * dtild);
	
	%generate approx of clear dollar
	XMat(:,i)= xtild_lam;
end

figure(2);
imagesc(XMat); colormap('gray');

end

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