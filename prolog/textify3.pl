textify3(L,Nc,I,O):-textify(L,Nc,I,O,[]).
textify([X,Y,Z],Nc,[X,Y,Z|Ys],O,R):-textify([X,Y,Z],Nc,Ys,O,[Nc|R]).
textify([X,Y,Z],Nc,[H|Ys],O,R):-textify([X,Y,Z],Nc,Ys,O,[H|R]).
textify([_,_,_],_,[],O,R):-reverse(R,L),O=L.
