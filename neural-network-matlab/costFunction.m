function [J, grad] = costFunction(nn_params,X,Y,lambda,hidden_layer_size,outX,outY)
J = 0;

start_point1 = 1;
end_point1 = ((outX*outY)+1)*hidden_layer_size;
start_point2 = end_point1 + 1;
end_point2 = end_point1 + (hidden_layer_size*(1+(hidden_layer_size)));
start_point3 = end_point2 + 1;
end_point3 = start_point3 - 1  + (hidden_layer_size+1)*outX*outY;
Theta1 = reshape(nn_params(start_point1:end_point1),hidden_layer_size,(outX*outY)+1);
Theta2 = reshape(nn_params(start_point2:end_point2),hidden_layer_size,hidden_layer_size+1);
Theta3 = reshape(nn_params(start_point3:end_point3),outX*outY,hidden_layer_size+1);


m = size(X,1);

a1 = [ones(m, 1) X];
z2 = a1 * Theta1';
a2 = sigmoid(z2);
a2 = [ones(m,1) a2];
z3 = a2 * Theta2';
a3 = sigmoid(z3);
a3 = [ones(m,1) a3];
z4 = a3 * Theta3';
a4 = sigmoid(z4);

h = a4;

%for i= 1:m
%    for k=1:(outX*outY)
%        J = J + ((-Y(i,k)*log(h(i,k))) - ((1-Y(i,k))*log(1-h(i,k))));
%    end
%end

J = J + sum(sum(((-Y.*log(h)) - ((1-Y).*log(1-h)))));

J = J/m;
Theta1Reg = 0;
Theta2Reg = 0;

%for j=1:hidden_layer_size
%    for k=2:(outX+outY)+1
%        Theta1Reg = Theta1Reg + (Theta1(j,k)^2);
%    end
%end

Theta1Reg = Theta1Reg + sum(sum(Theta1(:,2:end).^2));

%for j=1:hidden_layer_size
%    for k=2:hidden_layer_size+1
%        Theta2Reg = Theta2Reg + (Theta2(j,k)^2);
%    end
%end

Theta2Reg = Theta2Reg + sum(Theta2(:,2:end).^2);

J = J + sum(sum((lambda./(2.*m)).*(Theta1Reg+Theta2Reg)));

delta_4 = h - Y;
delta_3 = (delta_4 * Theta3(:,2:end)).*sigmoidGradient(z3);
delta_2 = (delta_3 * Theta2(:,2:end)).*sigmoidGradient(z2);
Theta1(:,1) = 0;
Theta2(:,1) = 0;
Theta3(:,1) = 0;
Theta1_grad = ((delta_2'*a1)/m)+((lambda/m)*Theta1);
Theta2_grad = ((delta_3'*a2)/m)+((lambda/m)*Theta2);
Theta3_grad = ((delta_4'*a3)/m)+((lambda/m)*Theta3);
grad = [Theta1_grad(:) ; Theta2_grad(:) ; Theta3_grad(:)];

end
