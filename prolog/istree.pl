istree(t(_,nil,nil)).
istree(nil).
istree(t(_,L,R)):-istree(t(L,_,_)),istree(t(R,_,_)).


