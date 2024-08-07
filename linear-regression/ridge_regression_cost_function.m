function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  FeatureMatrix=double(FeatureMatrix);
  Y=double(Y);
  % numarul de exemple
  m = length(Y); 
  % calculez vectorul h
  h = FeatureMatrix * Theta(2:end); 
  % calculez eroarea conform formulei
  Error = (1/(2*m)) * sum((h-Y).^2) + lambda * sum(Theta(2:end).^2); % cost function
endfunction