inter([],[],[]).
inter([],_,[]).
inter(_,[],[]).
inter([X|Xs],Y,Rs):-not(member(X,Y)),inter(Xs,Y,Rs).
inter([X|Xs],Y,[X|Rs]):-inter(Xs,Y,Rs).
