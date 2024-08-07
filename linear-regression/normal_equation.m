function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
  FeaturesMatrix=double(FeaturesMatrix);
  Y = double(Y);
  % verific daca matricea este poz definita
  A=FeaturesMatrix'*FeaturesMatrix;
    eigenvalues = eig(A);
    % nu este poz def deci vectorul e plin de 0
    if any(eigenvalues <= 0)
      Theta=zeros(rows(A)+1,1);
      return;
    endif
  i=0;
  % calculez vectorul conform formulei de iter ori
  Theta=inv(FeaturesMatrix' * FeaturesMatrix) * FeaturesMatrix' * Y;
  while i<iter
    prev=Theta;
    Theta=inv(FeaturesMatrix' * FeaturesMatrix) * FeaturesMatrix' * Y;
    % daca eroarea este mai mica decat tol opresc iteratia
    if norm(Theta-prev)<tol
      break;
    endif
    i++;
  endwhile
  % introduc t0=0
  aux=[0;Theta(1:end)];
  Theta=aux;
endfunction