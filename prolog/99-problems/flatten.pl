my_flatten([],[]).
my_flatten([X|Xs],[X|R]):- \+is_list(X),my_flatten(Xs,R).
my_flatten([X|Xs],R):-my_flatten(X,Z1),my_flatten(Xs,Z2),append(Z1,Z2,R).
