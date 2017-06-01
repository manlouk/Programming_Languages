middle([],[]).
middle([X],[X]).
middle([X,Y],[X,Y]).
middle(X,Y):-find_first(X,F),last(X,L),find_middle(X,M),middle(M,Ys),append([F],[Ys],Z),append(Z,[L],Y),!.


delete_last([_],[]).
delete_last([X|Xs],[X|M]):-delete_last(Xs,M).

find_middle([],[]).
find_middle([X],[X]).
find_middle([X,Y],[X,Y]).
find_middle([X|Xs],M):-delete_last([X|Xs],[_|Ys]),M=Ys.

find_first([X],X).
find_first([X|_],X).
