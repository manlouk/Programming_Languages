last_but_one(X,[X,_]).
last_but_one(X,[_|T]):-last_but_one(X,T).
