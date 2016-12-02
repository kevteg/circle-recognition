%Neural Network Training
function [] = train()
  TrainingSamples = 10;
  hidden_layer_size = 250;
  [X,Y,inX,inY,outX,outY] = loadSamples(TrainingSamples);
  Theta1 = initializeWeights(outX*outY,hidden_layer_size);
  Theta2 = initializeWeights(hidden_layer_size,hidden_layer_size);
  Theta3 = initializeWeights(hidden_layer_size,outX*outY);
  initial_nn_params = [Theta1(:);Theta2(:);Theta3(:)];
  options = optimset('MaxIter', 50);
  lambda = 1;
  costFunc = @(p) costFunction(p,X,Y,lambda,hidden_layer_size,outX,outY);
  [nn_params, cost] = fmincg(costFunc, initial_nn_params, options);
  end
