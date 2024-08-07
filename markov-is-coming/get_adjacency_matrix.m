function [Adj] = get_adjacency_matrix(Labyrinth)
  nr_stari = rows(Labyrinth)*columns(Labyrinth);
  % creez matricea rara
  Adj = sparse(nr_stari+2,nr_stari+2);
  stare=0;
  for i=1:rows(Labyrinth)
    for j=1:columns(Labyrinth)
      stare++;
      % verific bitul nord
      if bitget(Labyrinth(i,j),4) == 0
        % calculez starea in care va trece
        next_stare=stare-columns(Labyrinth);
        % daca este o stare care nu e in matrice inseamna ca e starea WIN
        if next_stare < 1
          Adj(stare,nr_stari+1)=1;
        else
          Adj(stare,next_stare)=1;
        end
      endif
      % verific bitul sud
      if bitget(Labyrinth(i,j),3) == 0
        next_stare=stare+columns(Labyrinth);
        if next_stare > nr_stari
          Adj(stare,nr_stari+1)=1;
        else
          Adj(stare,next_stare)=1;
        end
      endif
      % verific bitul est
      if bitget(Labyrinth(i,j),2) == 0
        next_stare=stare+1;
        % daca este o stare care nu e in matrice inseamna ca e starea LOSE
        if next_stare > i*columns(Labyrinth);
          Adj(stare,nr_stari+2)=1;
        else
          Adj(stare,next_stare)=1;
        end
      endif
      % verific bitul vest
      if bitget(Labyrinth(i,j),1) == 0
        next_stare=stare-1;
        if next_stare == (i-1)*columns(Labyrinth);
          Adj(stare,nr_stari+2)=1;
        else
          Adj(stare,next_stare)=1;
        end
      endif
    endfor
  endfor
  % setez 1 in matrice starile WIN LOSE
  Adj(nr_stari+1,nr_stari+1)=1;
  Adj(nr_stari+2,nr_stari+2)=1;
endfunction
