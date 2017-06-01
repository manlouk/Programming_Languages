delete_all([],_,[]).
delete_all([X|Xs],Y,[X|R]):- X =\= Y,delete_all(Xs,Y,R).
delete_all([_|Xs],Y,R):-delete_all(Xs,Y,R).
