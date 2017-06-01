mergesort([],[]).
mergesort([X],[X]).
mergesort(X,R):-split(X,Y,Z),mergesort(Y,R1),mergesort(Z,R2),merge(R1,R2,R).

merge([],[],[]).
merge(L,[],L).
merge([],L,L).
merge([X|Xs],[Y|Ys],[X|R]):-X<Y,merge(Xs,[Y|Ys],R).
merge([X|Xs],[Y|Ys],[Y|R]):-merge([X|Xs],Ys,R).

split([X,Y],[Y],[X]).
split([X],[],[X]).
split([X,Y|Xs],[Y|Ys],[X|R]):-split(Xs,Ys,R).