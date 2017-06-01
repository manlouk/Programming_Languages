equal(X,Y):-isEqual(X,Y,[]).
isEqual([],[Y|Ys],R):-member(Y,R),isEqual([],Ys,R).
isEqual([X|Xs],Y,R):-member(X,Y),isEqual(Xs,Y,[X|R]).
isEqual([],[],_).
