function [G, c] = get_Jacobi_parameters(Link)
  % extrag parametrii necesari pentru iteratie excluzand starile de WIN LOSE
  n = rows(Link);
  G = Link(1:n-2,1:n-2);
  c = Link(1:n-2,n-1);
endfunction
