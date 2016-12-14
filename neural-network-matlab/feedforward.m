function [] = feedforward(nn_params,X,hidden_layer_size,outX,outY)

start_point1 = 1;
end_point1 = ((outX*outY)+1)*hidden_layer_size;
start_point2 = end_point1 + 1;
end_point2 = end_point1 + (outX*outY*(1+(hidden_layer_size)));
Theta1 = reshape(nn_params(start_point1:end_point1),hidden_layer_size,(outX*outY)+1);
Theta2 = reshape(nn_params(start_point2:end_point2),outX*outY,hidden_layer_size+1);

m = size(X,1);

a1 = [ones(m, 1) double(X)];
z2 = a1 * Theta1';
a2 = sigmoid(z2);
a2 = [ones(m,1) a2];
z3 = a2 * Theta2';
a3 = sigmoid(z3);

Y = a3;

imagenY = reshape(Y,outX,outY);
imagenX = reshape(X,outX,outY);
figure;
imshow(imagenX);
figure;
imshow(imagenY);

end
