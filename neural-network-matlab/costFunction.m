function [J] = costFunction(nn_params,X,Y,lambda,num_layers,xsize,ysize)
J = 0;
Thetas = zeros(num_layers,xsize*ysize,(1+(xsize*ysize)));

for n=1:num_layers
  Thetas(n,:,:) = reshape(nn_params(((n-1)*(xsize*ysize)*((xsize*ysize)+1))+1:n*(xsize*ysize)*((xsize*ysize)+1)),xsize*ysize,1+(xsize*ysize))
end

m = size(X,1),

a1 = [ones(m, 1) X];
z2 = a1 * Thetas(1,:,:)';
an = sigmoid(z2);
if num_layers > 1
  for n=2.num_layers
    an = [ones(m,1) an];
    zn = an * Thetas(n,:,:)';
    an = sigmoid(an);
  end
end

h = an;

end
    
