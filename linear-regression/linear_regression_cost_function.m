function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  m=rows(FeatureMatrix);
  % calculez vectorul h
  h = FeatureMatrix * Theta(2:end) + Theta(1);
  % calculez eroarea vectorului conform formulei
  err = h - Y;
  Error = sum(err.^2)/(2*m);
endfunction