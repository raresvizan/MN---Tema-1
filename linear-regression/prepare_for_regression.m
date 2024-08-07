function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [m n] = size(InitialMatrix);
  for i=1:m
    % memorez daca am adaugat sau nu o coloana in matrice
    add=0;
    % schimb stringurile in numere asemenea cerintei
    for j=1:n
      if ~isnumeric(InitialMatrix{i,j})
        if strcmp(InitialMatrix{i,j}, "yes")==1
          FeatureMatrix(i,j)=1;
        elseif strcmp(InitialMatrix{i,j}, "no")==1
          FeatureMatrix(i,j) = 0;
        elseif strcmp(InitialMatrix{i,j}, "semi-furnished")==1
          FeatureMatrix(i,j) = 1;
          FeatureMatrix(i,j+1) = 0;
          % am pus 2 indici in matrice pentru ac string deci cresc nr de col
          add=1;
        elseif strcmp(InitialMatrix{i,j}, "unfurnished")==1
          FeatureMatrix(i,j) = 0;
          FeatureMatrix(i,j+1) = 1;
          add=1;
        elseif strcmp(InitialMatrix{i,j}, "furnished")==1
          FeatureMatrix(i,j) = 0;
          FeatureMatrix(i,j+1) = 0;
          add=1;
        endif
      else
        FeatureMatrix(i,j+add)=InitialMatrix(i,j);
      endif
    endfor
  endfor
    % transform matricea de tip cell in una normala
    FeatureMatrix=cell2mat(FeatureMatrix);
endfunction