function [Labyrinth] = parse_labyrinth(file_path)
  file = fopen(file_path, 'r');
  % citesc nr linii si nr coloane
  m = fscanf(file,"%d",1);
  n = fscanf(file,"%d",1);
  % citesc elementele matricei
  for i=1:m
    for j=1:n
      Labyrinth(i,j) = fscanf(file, "%d",1);
    endfor
  endfor
endfunction
