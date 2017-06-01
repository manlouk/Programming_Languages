maxList(X,M):-maxL(X,M,-1).
maxL([X|Xs],M,Y):-X>Y,maxL(Xs,M,X).
maxL([_|Xs],M,Y):-maxL(Xs,M,Y).
maxL([],Y,Y).

