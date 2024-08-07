function [path] = heuristic_greedy(start_position, probabilities, Adj)
  nr_stari=rows(Adj);
  probabilities(end+1)=1;
  probabilities(end+1)=0;
  % creez stiva de stari
  path=[start_position];
  % creez vectorul care mi spune ce stari am parcurs
  visited = zeros(1, nr_stari);
  visited(start_position)=1;
  while isempty(path)==0
    % extrag din stiva
    position=path(end);
    % daca sunt pe pozitia de WIN
    if position == nr_stari-1
      return;
    endif
    % creez vectorul care mi spune ce stari nu am parcurs
    unvisited = find(Adj(position,:) & ~visited);
    % sterg din stiva daca nu am vecini nevizitati
    if isempty(unvisited)
      path(end) = [];
    endif
    maxim=-1;
    % gasesc vecinul nevizitat cu cea mai mare probabilitate de WIN
    for i=1:length(unvisited)
      if maxim < probabilities(unvisited(i))
        maxim = probabilities(unvisited(i));
        neigh = unvisited(i);
      endif
    endfor
    visited(neigh) = 1;
    % adaug in stiva starea
    path = [path; neigh];
  endwhile
  return;
endfunction
