subset([], []).
subset([H|T1], [H|T2]) :- subset(T1, T2).
subset(L, [_|T]) :- subset(L, T).

comb(K,X,L):-subset(L,X),length(L,K).
