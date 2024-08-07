function [Y, InitialMatrix] = parse_data_set_file(file_path)
  file=fopen(file_path,'r');
  % citesc nr de linii si coloane
  m = fscanf(file,"%d",1);
  n = fscanf(file,"%d",1);
  % initialiez matricea de tip cell
  InitialMatrix = cell(m, n+1);
  for i=1:m
    % citesc elementele primei coloane pt vectorul de iesire
    Y(i)=fscanf(file,"%d",1);
    for j=1:n
      % citesc elem matricei
      aux=fscanf(file,"%f",1);
      % daca e gol inseamna ca e un string
      if ~isempty(aux)
        InitialMatrix{i,j}=aux;
      else
        InitialMatrix{i,j}=fscanf(file,"%s",1);
      end
    endfor
  endfor
endfunction