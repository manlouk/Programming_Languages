union([H|T],[],[H|T]).     
union([],[H|T],[H|T]).    
union([H|T], SET2, RESULT) :- member(H,SET2), union(T,SET2,RESULT).    
union([H|T], SET2, [H|RESULT]) :- not(member(H,SET2)), union(T,SET2,RESULT).
