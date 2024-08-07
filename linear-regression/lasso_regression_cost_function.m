function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
  FeMatrix=double(FeMatrix);
  Y=double(Y);
  % numarul de exemple
  m = length(Y); 
  % calculez vectorul h
  h = FeMatrix * Theta(2:end); 
  % calculez eroarea conform formulei
  Error = (1/m) * sum((h-Y).^2) + lambda * sum(abs(Theta(2:end))); % cost function
endfunction