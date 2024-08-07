function [matrix] = initialize_weights(L_prev, L_next)
  % calculez epsilon conform formulei
  e = sqrt(6) / sqrt(L_prev + L_next);
  % creez matricea random de elemente conform cerintei
  matrix = rand(L_next, L_prev+1) * 2 * e - e;
endfunction