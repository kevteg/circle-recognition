function [W] = initializeWeights(in,out)

W = zeros(out,in+1);
epsilon_init = 0.12;
W = rand(out, in+1) * 2 * epsilon_init - epsilon_init;

end