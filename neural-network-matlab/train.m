%Neural Network Training

TrainingSamples = 10;
hidden_layers = 2;
[X,Y,inX,inY,outX,outY] = loadSamples(TrainingSamples);
if hidden_layers>1
    Thetas = zero(hidden_layers-1,outX*outY,1+(outX*outY));
    for n=1:hidden_layers-1
      Thetas(n,:,:) = initializeWeights(outX*outY,outX*outY);
    end
end
ThetaFinal = zeros(outX*outY,1+(inX+inY));
ThetaFinal = initializeWeights(inX*inY,outX*outY);
