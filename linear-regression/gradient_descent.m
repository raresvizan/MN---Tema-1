function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(n, 1);
  % deoarece au elemente reale fac cast la double
  Theta = double(Theta);
  FeatureMatrix=double(FeatureMatrix);
  for i = 1:iter
    % calculez vectorul h pentru fiecare exemplu
    h = FeatureMatrix * Theta;
    % calculez gradientul conform formulei
    gradient = (1/m) * FeatureMatrix' * double((h - Y));
    % actualizez vectorul 
    Theta = Theta - alpha * gradient;
  endfor
  % adaug t0 = 0
  aux=[0;Theta(1:n)];
  Theta=aux;
endfunction
