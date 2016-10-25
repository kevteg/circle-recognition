function [X,Y,inX,inY,outX,outY] = loadSamples(num)
  system("rm matrix/*.mat");
  system(["python input/generate.py -i 1.jpg -n ", num2str(num)]);
  X1 = load("matrix/0-input.mat","image_input").image_input;
  [inX,inY] = size(X1);
  X1 = X1(:);
  Y1 = load("matrix/0-output.mat","image_output").image_output;
  Y1 = Y1(:,:,1);
  [outX,outY] = size(Y1);
  Y1 = Y1(:);
  X = zeros(num,size(X1),"uint8");
  Y = zeros(num,size(Y1),"uint8");
  for n=1:num
    X(n,:) = load(["matrix/" num2str(n-1) "-input.mat"],"image_input").image_input(:);
    Y(n,:) = load(["matrix/" num2str(n-1) "-output.mat"],"image_output").image_output(:,:,1)(:);
  endfor
end