function [Y, InitialMatrix] = parse_csv_file(file_path)
  f=fopen(file_path, 'r');
  % selectez prima linie de header
  line=fgetl(f);
  % setez formatul tabelului
  format="%d,%d,%d,%d,%d,%s,%s,%s,%s,%s,%d,%s,%s";
  % extarg datele
  data=textscan(f,format, 'Delimiter', ',');
  lines=rows(data{1});
  for j=1:13
    for i=1:lines
      % deoarece stringurile au fost salvate ca un cell in cell le transform
      if iscell(data{j}(i))
        InitialMatrix{i,j}=char(data{j}(i));
      else
        InitialMatrix{i,j}=data{j}(i);
      endif
    endfor
  endfor
  % creez vectorul iesirilor si il transform intr un vector normal
  Y = InitialMatrix(1:lines,1);
  Y = cell2mat(Y);
  % creez matricea
  InitialMatrix=InitialMatrix(1:lines,2:13);
endfunction