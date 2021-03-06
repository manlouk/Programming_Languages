coverDecision(Set,Subsets,Goal,Cover):-subseq(Cover,Subsets),union(Cover,Set),length(Cover,Z),Z =< Goal.





subseq([],[]).
subseq([H|T1],[H|T2]):-subseq(T1,T2).
subseq(X,[_|T2]):-subseq(X,T2).

union([],[]).
union([X|Xs],[X|R]):- \+is_list(X),union(Xs,R).
union([X|Xs],R):-union(X,Z),union(Xs,Y),append(Z,Y,R).

