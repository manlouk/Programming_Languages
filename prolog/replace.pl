replace_all([],_,_,[]).
replace_all([X|Xs],Y,Z,[X|R]):-X \= Y,replace_all(Xs,Y,Z,R).
replace_all([_|Xs],Y,Z,[Z|R]):-replace_all(Xs,Y,Z,R).
