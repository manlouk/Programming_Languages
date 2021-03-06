danger(File,X):-read_and_return(File,N,Combos),create_list(N,Set),aggregate(max(N,X),subset1(Set,X),length(X,N),safe(Combos,X)).

maxC([X|Xs],R):-length(X,N),maxCover(Xs,X,N,R).
maxCover([],X,_,X).
maxCover([X|Xs],_,N,R):-length(X,Z),Z > N ,maxCover(Xs,X,Z,R).
maxCover([_|Xs],Y,N,R):-maxCover(Xs,Y,N,R).

check_sol(X,[Y|_],Y):-safe(X,Y).
check_sol(X,[_|Ys],R):-check_sol(X,Ys,R).

safe([],_).
safe([Combos|Rest],X):- \+ sublist(Combos,X),safe(Rest,X).

sublist([],_).
sublist([X|Xs],Y):-member(X,Y),sublist(Xs,Y).


create_list(N,L):-M is N+1,create(N,M,L,[]).
create(N,M,L,R):-M1 is M-1,M1>=1,create(N,M1,L,[M1|R]).
create(_,_,R,R).

combinations(K,X,L):-subset(L,X),length(L,K).



%list_of(Set,Out):-findall(Y,subset(Y,Set),L),lsort(L,Out).

subset1([],[],_).
subset1([X|Xs],[X|Ys]):-subset1(Xs,Ys).
subset1(Xs,[_|Ys]):-subset1(Xs,Ys).

lsort(InList,OutList) :- lsort(InList,OutList,asc).

% sorting direction Dir is either asc or desc

lsort(InList,OutList,Dir) :-
   add_key(InList,KList,Dir),
   keysort(KList,SKList),
   rem_key(SKList,OutList).

add_key([],[],_).
add_key([X|Xs],[L-p(X)|Ys],asc) :- !, 
	length(X,L), add_key(Xs,Ys,asc).
add_key([X|Xs],[L-p(X)|Ys],desc) :- 
	length(X,L1), L is -L1, add_key(Xs,Ys,desc).

rem_key([],[]).
rem_key([_-p(X)|Xs],[X|Ys]) :- rem_key(Xs,Ys).

% b) length frequency sort
%
% lfsort (InList,OutList) :- it is supposed that the elements of InList
% are lists themselves. Then OutList is obtained from InList by sorting
% its elements according to their length frequency; i.e. in the default,
% where sorting is done ascendingly, lists with rare lengths are placed
% first, other with more frequent lengths come later.
%
% Example:
% ?- lfsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
% L = [[i, j, k, l], [o], [a, b, c], [f, g, h], [d, e], [d, e], [m, n]]
%
% Note that the first two lists in the Result have length 4 and 1, both
% length appear just once. The third and forth list have length 3 which
% appears, there are two list of this length. And finally, the last
% three lists have length 2. This is the most frequent length.

lfsort(InList,OutList) :- lfsort(InList,OutList,asc).

% sorting direction Dir is either asc or desc

lfsort(InList,OutList,Dir) :-
	add_key(InList,KList,desc),
   keysort(KList,SKList),
   pack(SKList,PKList),
   lsort(PKList,SPKList,Dir),
   flatten(SPKList,FKList),
   rem_key(FKList,OutList).
   
pack([],[]).
pack([L-X|Xs],[[L-X|Z]|Zs]) :- transf(L-X,Xs,Ys,Z), pack(Ys,Zs).

% transf(L-X,Xs,Ys,Z) Ys is the list that remains from the list Xs
%    when all leading copies of length L are removed and transfed to Z

transf(_,[],[],[]).
transf(L-_,[K-Y|Ys],[K-Y|Ys],[]) :- L \= K.
transf(L-_,[L-X|Xs],Ys,[L-X|Zs]) :- transf(L-X,Xs,Ys,Zs).
    

/*
 * This file contains two predicates
 *   - read_and_just_print_dangers/1
 *   - read_and_return/3
 * that illustrate reading one line at a time from a file in SWI Prolog.
 * The file has the format of input files of the 'danger' exercise.
 */

/*
 * The first predicate is not so interesting. It just shows you how you can
 * write in Prolog a predicate that contains a loop with *only* side-effects.
 * Use as:
 *
 *   ?- read_and_just_print_dangers('forbidden1.txt').
 */
read_and_just_print_dangers(File) :-
    open(File, read, Stream),
    repeat,
    read_line_to_codes(Stream, X),
    ( X \== end_of_file -> writeln(X), fail ; close(Stream), ! ).

/*
 * The second predicate reads the information of an input file and returns
 * it in the next two arguments: an integer and a list with combinations of
 * dangerous measurements represented as lists, as in the example below:
 * 
 *   ?- read_and_return('forbidden1.txt', M, Combos).
 *   M = 8,
 *   Combos = [[1, 2], [3, 2], [7], [3, 4], [5, 6, 4]].
 *
 * To read the information of each of the segments, it uses the auxiliary
 * predicate read_segs/3.
 */

read_and_return(File, N, Combos) :-
    open(File, read, Stream),
    read_line(Stream, [N, M]),
    read_segs(Stream, M, Combos),
    close(Stream).

read_segs(Stream, M, Combos) :-
    ( M > 0 ->
	Combos = [Combo|Rest],
        read_line(Stream, [K|Combo]),
	length(Combo, K), %% just an assertion for for extra safety 
        M1 is M - 1,
        read_segs(Stream, M1, Rest)
    ; M =:= 0 ->
	Combos = []
    ).

/*
 * An auxiliary predicate that reads a line and returns the list of
 * integers that the line contains.
 */
read_line(Stream, List) :-
    read_line_to_codes(Stream, Line),
    atom_codes(A, Line),
    atomic_list_concat(As, ' ', A),
    maplist(atom_number, As, List).
