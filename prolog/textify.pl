textify(R,Nc,In,Out):-txt(R,Nc,In,Out,[],[]).
txt(R,Nc,In,Out,SubIn,O):-length(R,N),length(SubIn,Z),N==Z,is_same(R,SubIn),append(O,[Nc],O),txt(R,Nc,In,Out,[],O).
txt(R,Nc,In,Out,SubIn,O):-length(R,N),length(SubIn,Z),N==Z,\+is_same(R,SubIn),append(O,SubIn,O),txt(R,Nc,In,Out,[],O).
txt(R,Nc,[H|In],Out,SubIn,O):-length(R,N),length(SubIn,Z),N > Z,append(SubIn,[H],S),txt(R,Nc,In,Out,S,O).
txt(_,_,_,O,_,O).


is_same([],[]).
is_same([X|Xs],[X|Ys]):-is_same(Xs,Ys).
