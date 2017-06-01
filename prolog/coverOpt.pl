coverOpt(Set,Subsets,Cover):-findall(X,(subseq(X,Subsets),union(X,Set)),L),minC(L,Cover).


minC([X|Xs],R):-length(X,N),minCover(Xs,X,N,R).
minCover([],X,_,X).
minCover([X|Xs],_,N,R):-length(X,Z),Z =< N ,minCover(Xs,X,Z,R).
minCover([_|Xs],Y,N,R):-minCover(Xs,Y,N,R).


subseq([],[]).
subseq([H|T1],[H|T2]):-subseq(T1,T2).
subseq(X,[_|T2]):-subseq(X,T2).

union([],[]).
union([X|Xs],[X|R]):- \+is_list(X),union(Xs,R).
union([X|Xs],R):-union(X,Z),union(Xs,Y),append(Z,Y,R).
