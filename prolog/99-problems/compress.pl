compress(Xs,Ys):-comp(Xs,Ys,[]).
comp([X|Xs],Ys,[X|R]):-comp(Xs,Ys,[X|R]).
comp([X|Xs],Ys,R):-append(R,[X],Z),comp(Xs,Ys,Z).
comp([],R,R).
