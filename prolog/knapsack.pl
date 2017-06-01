knapsackDesicion(Pantry,Capacity,Goal,Knapsack):-
subseq(Knapsack,Pantry),weight(Knapsack,Weight),Weight =< Capacity,calories(Knapsack,Calories),Calories >=Goal.





subseq([],[]).
subseq([H|T1],[H|T2]):-subseq(T1,T2).
subseq(X,[_|T2]):-subseq(X,T2).

weight([],0).
weight([food(_,W,_)|Rest],X):-weight(Rest,RestWeight),X is RestWeight+W.

calories([],0).
calories([food(_,_,C)|Rest],X):-calories(Rest,RestCal),X is RestCal + C.

