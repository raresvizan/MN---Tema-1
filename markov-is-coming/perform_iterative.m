function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
  [n n]=size(G);
  steps = 0;
  % setez o eroare fictiva
  err = tol + 1;
  % fac interatia pana la finalul pasilor sau daca eroarea este prea mare
  while err > tol && steps < max_steps
    x = G * x0 + c;
    % calculez eroarea
    err = norm(x - x0);
    x0=x;
    steps++;
  endwhile
endfunction
