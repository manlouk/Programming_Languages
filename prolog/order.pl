ordered([]).
ordered([_]).
ordered([X,Y|Xs]):- X <  Y, ordered([Y|Xs]).
