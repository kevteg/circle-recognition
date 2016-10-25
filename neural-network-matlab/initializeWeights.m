function [W] = initializeWeights(in,out)

W = zeros(out,1+in);
epsilon_init = 0.12;
W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;

end