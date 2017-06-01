mirror(nil,nil).
mirror(t(_,L1,R1),t(_,L2,R2)):-mirror(t(L1,_,_),t(L2,_,_)),mirror(t(R1,_,_),t(R2,_,_)).
