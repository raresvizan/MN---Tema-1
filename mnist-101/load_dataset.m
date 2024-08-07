function [X, y] = load_dataset(path)
  % incarc datasetul
  dataset=load(path);
  % setez exemplele pentru training si test
  X = dataset.X;
  y = dataset.y;
endfunction