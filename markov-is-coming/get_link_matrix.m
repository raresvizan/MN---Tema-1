function [Link] = get_link_matrix(Labyrinth)
  % creez matricea de adiacenta
  Link = get_adjacency_matrix(Labyrinth);
  for i=1:rows(Link)
    % calculez cate elemente de 1 am
    elem = sum(Link(i,:)==1);
    % pun in locul elem de 1 probabilitatea
    j = find(Link(i,:));
    Link(i,j)=1/elem;
  endfor
endfunction
