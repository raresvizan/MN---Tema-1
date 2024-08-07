function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % amestec exemplele
  index = randperm(size(X, 1));
  % calculez fractiunea
  n = round(percent * size(X, 1));
  % impart in cele 2 seturi
  X_train=X(index(1:n),:);
  y_train = y(index(1:n));
  X_test = X(index(n+1:end), :);
  y_test = y(index(n+1:end));
endfunction