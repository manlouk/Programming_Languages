construct_tree([],nil).
construct_tree([X|Xs],t(X,L,R)):-construct_tree(Xs,t(
