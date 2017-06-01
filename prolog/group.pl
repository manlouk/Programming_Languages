group3([],[],[],[]).
group3(L,G1,G2,G3):-subset(G1,L),length(G1,3),subset(G2,L),length(G2,3),subset(G3,L),length(G3,3),isDisjoint(G1,G2),isDisjoint(G2,G3),isDisjoint(G1,G3).

group(

isDisjoint([],_).
isDisjoint([X|Xs],Y):-not(member(X,Y)),isDisjoint(Xs,Y).

subset([], []).
subset([H|T1], [H|T2]) :- subset(T1, T2).
subset(L, [_|T]) :- subset(L, T).

