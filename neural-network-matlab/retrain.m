%Neural Network Training
function [nn_params,cost] = retrain(nn_params,lambda)
  TrainingSamples = 100;
  hidden_layer_size = 10;
  [X,Y,inX,inY,outX,outY] = loadSamples(TrainingSamples);
  Theta1 = initializeWeights(outX*outY,hidden_layer_size);
  Theta2 = initializeWeights(hidden_layer_size,outX*outY);
  initial_nn_params = [Theta1(:);Theta2(:)];
  options = optimset('MaxIter', 2000);
  costFunc = @(p) costFunction(p,X,Y,lambda,hidden_layer_size,outX,outY);
  [nn_params, cost] = fmincg(costFunc, nn_params, options);
  end
