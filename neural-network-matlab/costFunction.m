function [J grad] = costFunction(nn_params,inX,inY,outX,outy,hidden_layers,...
                                 X,Y,lambda)

if hidden_layers > 1
	Theta = zeros(hidden_layers-1,inX,inY);
	for n=1:hidden_layers-1
		Theta(n,:,:) = reshape(nn_params(1+(inX*inY*(n-1)+1):inX*inY*n),inX*inY,inX*inY+1);
	end
end

FinalTheta = reshape(nn_params(end-:end))

end
    