element_at(X,[X|_],1).
element_at(X,[_|T],K):-K>0,K1 is K-1,element_at(X,T,K1).
