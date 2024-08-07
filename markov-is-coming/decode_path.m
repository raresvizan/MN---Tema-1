function [decoded_path] = decode_path(path, lines, cols)
  % sterg starea de WIN
  path(end)=[];
  % calculez indicii starii
  for k=1:length(path)
    if mod(path(k),cols) == 0
      i = path(k)/cols;
      j = cols;
    else
      i = floor(path(k)/cols) + 1;
      j = mod(path(k),cols);
    end
    % memorez decodificarea
    decoded_path(k,1)=i;
    decoded_path(k,2)=j;
  endfor
endfunction
