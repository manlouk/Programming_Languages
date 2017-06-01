reverse_list([],[]).
reverse_list([X|Xs],R):-reverse_list(Xs,Z),append(Z,[X],R).

