split([],[],[]).
split([X|Xs],[X|P],N):-X>=0,split(Xs,P,N).
split([X|Xs],P,[X|N]):-split(Xs,P,N).
