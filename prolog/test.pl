decreasing_sublist(List,Len,DecrSub) :-
subset(List,DecrSub),
sort(DecrSub,DecrSubSorted),
reverse(DecrSubSorted,DecrSub),
length(DecrSub,Len).


subset([], []).
subset([H|T1], [H|T2]) :- subset(T1, T2).
subset(L, [_|T]) :- subset(L, T).
    




