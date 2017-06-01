
diapragmateysi(State,Moves):-
	initialization(Q_l,Q_r,_,_,Hash_L,Hash_R,node(State,"")),bfs(Q_l,Q_r,Hash_L,Hash_R,State,Moves).



%queues and hashmaps initialization.
initialization(Q_Left,Q_Right,Empty_R,Empty_L,Hash_L,Hash_R,node(State,Path)):-
	string_codes("bgbGgGGrGyry",C),make_queue(Q_l),join_queue(node(C,""),Q_l,Q_Left),
	make_queue(Q_r),join_queue(node(State,Path),Q_r,Q_Right),
	empty_assoc(Empty_R),put_assoc("",Empty_R,State,Hash_R),empty_assoc(Empty_L),string_codes("bgbGgGGrGyry",C),put_assoc("",Empty_L,C,Hash_L).


bfs(_,Q_right,_,_,HashR,Moves):-
		head_queue(Q_right,node(State_right,Path_right)),
		%serve_queue(Q_left,node(_,_),_),
		is_equal_with_goal(node(State_right,Path_right),"bgbGgGGrGyry"),
		find_path_r(node(State_right,Path_right),HashR,State_right,Moves).		
		%find_path_left(node(State_right,Path_right),HashL,Root_left,Moves),!.
bfs(Q_left,_,_,HashL,Root_left,Moves):-
		%serve_queue(Q_right,node(_,_),_),
		head_queue(Q_left,node(State_left,Path_left)),
		is_equal_with_goal(node(State_left,Path_left),Root_left),
		find_path_l(node(State_left,Path_left),HashL,State_left,Moves).		
		%find_path_right(node(State_left,Path_left),HashR,"bgbGgGGrGyry",Moves),!.

bfs(_,Q_right,HashL,_,_,Moves):-
	head_queue(Q_right,node(State_right,Path_right)),
	node_belongs_to_Hash(node(State_right,Path_right),HashL),
	find_path_left(node(State_right,Path_right),HashL,"bgbGgGGrGyry",Moves),!.

bfs(Q_left,_,_,HashR,Root_left,Moves):-
		%list_to_queue(Q_left,L),write(L),nl,
		head_queue(Q_left,node(State_left,Path_left)),
		node_belongs_to_Hash(node(State_left,Path_left),HashR),
		find_path_right(node(State_left,Path_left),HashR,Root_left,Moves),!.
bfs(Q_left,Q_right,HashL,HashR,Root_left,Moves):-
	serve_queue(Q_left,node(State_left,Path_left),NQ_left),serve_queue(Q_right,node(State_right,Path_right),NQ_right),
	add_elements_right(NQ_right,HashR,node(State_right,Path_right),NNQ_right,NHashR),
	add_elements_left(NQ_left,HashL,node(State_left,Path_left),NNQ_left,NHashL),
	%write(NHashR),nl,break,
	%length_queue(Q_left,L),write(L),nl,
	bfs(NNQ_left,NNQ_right,NHashL,NHashR,Root_left,Moves).

	
	
node_belongs_to_Hash(node(S,_),Hash):-get_assoc(S,Hash,_).	

add_elements_left(Q,Hash,node(State,Path),NQ4,NHash4):-
	left_1_(node(State,Path),node(NState1,NPath1)),(get_assoc(NState1,Hash,_)->(NQ1=Q,NHash1=Hash);(put_assoc(NState1,Hash,State,NHash1),join_queue(node(NState1,NPath1),Q,NQ1))),
	left_2_(node(State,Path),node(NState2,NPath2)),(get_assoc(NState2,NHash1,_)->(NQ2=NQ1,NHash2=NHash1);(put_assoc(NState2,NHash1,State,NHash2),join_queue(node(NState2,NPath2),NQ1,NQ2))),
	left_3_(node(State,Path),node(NState3,NPath3)),(get_assoc(NState3,NHash2,_)->(NQ3=NQ2,NHash3=NHash2);(put_assoc(NState3,NHash2,State,NHash3),join_queue(node(NState3,NPath3),NQ2,NQ3))),
	left_4_(node(State,Path),node(NState4,NPath4)),(get_assoc(NState4,NHash3,_)->(NQ4=NQ3,NHash4=NHash3);(put_assoc(NState4,NHash3,State,NHash4),join_queue(node(NState4,NPath4),NQ3,NQ4))).

add_elements_right(Q,Hash,node(State,Path),NQ4,NHash4):-
	right_1(node(State,Path),node(NState1,NPath1)),(get_assoc(NState1,Hash,_)->(NQ1=Q,NHash1=Hash);(put_assoc(NState1,Hash,State,NHash1),join_queue(node(NState1,NPath1),Q,NQ1))),
	right_2(node(State,Path),node(NState2,NPath2)),(get_assoc(NState2,NHash1,_)->(NQ2=NQ1,NHash2=NHash1);(put_assoc(NState2,NHash1,State,NHash2),join_queue(node(NState2,NPath2),NQ1,NQ2))),
	right_3(node(State,Path),node(NState3,NPath3)),(get_assoc(NState3,NHash2,_)->(NQ3=NQ2,NHash3=NHash2);(put_assoc(NState3,NHash2,State,NHash3),join_queue(node(NState3,NPath3),NQ2,NQ3))),
	right_4(node(State,Path),node(NState4,NPath4)),(get_assoc(NState4,NHash3,_)->(NQ4=NQ3,NHash4=NHash3);(put_assoc(NState4,NHash3,State,NHash4),join_queue(node(NState4,NPath4),NQ3,NQ4))).



find_path_right(node(State,Path),Hash,Goal,Moves):-find_path_r(node(State,Path),Hash,Goal,Moves).

find_path_r(node(Parent,Path),HashR,Goal,Moves):-
  \+is_equal_with_goal(node(Parent,Path),Goal),get_assoc(Parent,HashR,Child),find_moves_left(node(Parent,Path),node(NChild,NPath)),is_equal(NChild,Child),find_path_r(node(Child,NPath),HashR,Goal,Moves).

find_path_r(node(_,M),_,_,M).

is_equal(C,X):-C==X.
find_path_left(node(State,Path),HashL,Goal,Moves):-find_path_l(node(State,Path),HashL,Goal,Moves).

find_path_l(node(State,Path),HashL,Goal,Moves):-
	\+is_equal_with_goal(node(State,Path),Goal),get_assoc(State,HashL,Child),find_moves_right(node(State,Path),node(Child,NPath)),find_path_l(node(Child,NPath),HashL,Goal,Moves).

find_path_l(node(_,M),_,_,M).


find_moves_right(node(State,Path),node(Child,NPath)):- right_1(node(State,Path),node(Child,NPath)).
find_moves_right(node(State,Path),node(Child,NPath)):- right_2(node(State,Path),node(Child,NPath)).
find_moves_right(node(State,Path),node(Child,NPath)):- right_3(node(State,Path),node(Child,NPath)).	
find_moves_right(node(State,Path),node(Child,NPath)):- right_4(node(State,Path),node(Child,NPath)).

find_moves_left(node(State,Path),node(Child,NPath)):- left_1_(node(State,Path),node(Child,NPath)).
find_moves_left(node(State,Path),node(Child,NPath)):- left_2_(node(State,Path),node(Child,NPath)).
find_moves_left(node(State,Path),node(Child,NPath)):- left_3_(node(State,Path),node(Child,NPath)).	
find_moves_left(node(State,Path),node(Child,NPath)):- left_4_(node(State,Path),node(Child,NPath)).


is_equal_with_goal(node(State,_),Goal):- State==Goal.
%concat(Path,S,NPath):-string_to_atom(NP,Path),string_concat(NP,S,NPath).
right_1(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r1(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"1",NPath).

right_2(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r2(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"2",NPath).

right_3(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r3(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"3",NPath).

right_4(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r4(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"4",NPath).


left_1(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l1(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"1",NPath).

left_2(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l2(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"2",NPath).

left_3(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l3(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"3",NPath).

left_4(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l4(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"4",NPath).

right_1_(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r1(Codes,NCodes),string_codes(NState,NCodes),string_concat("1",Path,NPath).

right_2_(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r2(Codes,NCodes),string_codes(NState,NCodes),string_concat("2",Path,NPath).

right_3_(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r3(Codes,NCodes),string_codes(NState,NCodes),string_concat("3",Path,NPath).

right_4_(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r4(Codes,NCodes),string_codes(NState,NCodes),string_concat("4",Path,NPath).

left_1_(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l1(Codes,NCodes),string_codes(NState,NCodes),string_concat("1",Path,NPath).

left_2_(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l2(Codes,NCodes),string_codes(NState,NCodes),string_concat("2",Path,NPath).

left_3_(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l3(Codes,NCodes),string_codes(NState,NCodes),string_concat("3",Path,NPath).

left_4_(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l4(Codes,NCodes),string_codes(NState,NCodes),string_concat("4",Path,NPath).


roll_r1([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X2,X1,X5,X0,X4,X3,X6,X7,X8,X9,X10,X11]).

roll_r2([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X3,X2,X6,X1,X5,X4,X7,X8,X9,X10,X11]).

roll_r3([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X1,X2,X3,X4,X7,X6,X10,X5,X9,X8,X11]).

roll_r4([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X1,X2,X3,X4,X5,X8,X7,X11,X6,X10,X9]).


roll_l1([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X3,X1,X0,X5,X4,X2,X6,X7,X8,X9,X10,X11]).

roll_l2([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X4,X2,X1,X6,X5,X3,X7,X8,X9,X10,X11]).

roll_l3([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X1,X2,X3,X4,X8,X6,X5,X10,X9,X7,X11]).

roll_l4([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X1,X2,X3,X4,X5,X9,X7,X6,X11,X10,X8]).





make_queue(X-X).

%   join_queue(Element, OldQueue, NewQueue)
%   adds the new element at the end of the queue.  The old queue is
%   side-effected, so you *can't* do
%	join_queue(1, OldQ, NewQ1),
%	join_queue(2, OldQ, NewQ2).
%   There isn't any easy way of doing that, sensible though it might
%   be.  You *can* do
%	join_queue(1, OldQ, MidQ),
%	join_queue(2, MidQ, NewQ).
%   See list_join_queue.

join_queue(Element, Front-[Element|Back], Front-Back).

%   list_join_queue(List, OldQueue, NewQueue)
%   adds the new elements at the end of the queue.  The elements are
%   added in the same order that they appear in the list, e.g.
%   list_join_queue([y,z], [a,b,c|M]-M, [a,b,c,y,z|N]-N).

list_join_queue(List, Front-OldBack, Front-NewBack) :-
	append(List, OldBack, NewBack).

%   jump_queue(Element, OldQueue, NewQueue)
%   adds the new element at the front of the list.  Unlike join_queue,
%	jump_queue(1, OldQ, NewQ1),
%	jump_queue(2, OldQ, NewQ2)
%   *does* work, though if you add things at the end of NewQ1 they
%   will also show up in NewQ2.  Note that
%	jump_queue(1, OldQ, MidQ),
%	jump_queue(2, MidQ, NewQ)
%   makes NewQ start 2, 1, ...

jump_queue(Element, Front-Back, [Element|Front]-Back).



%   list_jump_queue(List, OldQueue, NewQueue)
%   adds all the elements of List at the front of the queue.  There  are
%   two  ways  we might do this.  We could add all the elements one at a
%   time, so that they would appear at the beginning of the queue in the
%   opposite order to the order they had in the list, or  we  could  add
%   them in one lump, so that they have the same order in the  queue  as
%   in  the  list.   As you can easily add the elements one at a time if
%   that is what you want, I have chosen the latter.

list_jump_queue(List, OldFront-Back, NewFront-Back) :-
	append(List, OldFront, NewFront).
%	reverse(List, OldFront, NewFront).	% for the other definition



%   head_queue(Queue, Head)
%   unifies Head with the first element of the queue.  The tricky part
%   is that we might be at the end of a queue: Back-Back, with Back a
%   variable, and in that case this predicate should not succeed, as we
%   don't know what that element is or whether it exists yet.

head_queue(Front-Back, Head) :-
	Front \== Back,		%  the queue is not empty
	Front = [Head|_].



%   serve_queue(OldQueue, Head, NewQueue)
%   removes the first element of the queue for service.

serve_queue(OldFront-Back, Head, NewFront-Back) :-
	OldFront \== Back,
	OldFront = [Head|NewFront].



%   empty_queue(Queue)
%   tests whether the queue is empty.  If the back of a queue were
%   guaranteed to be a variable, we could have
%	empty_queue(Front-Back) :- var(Front).
%   but I don't see why you shouldn't be able to treat difference
%   lists as queues if you want to.

empty_queue(Front-Back) :-
	Front == Back.



%   length_queue(Queue, Length)
%   counts the number of elements currently in the queue.  Note that
%   we have to be careful in checking for the end of the list, we
%   can't test for [] the way length(List) does.

length_queue(Front-Back, Length) :-
	length_queue(Front, Back, 0, N),
	Length = N.

length_queue(Front, Back, N, N) :-
	Front == Back, !.
length_queue([_|Front], Back, K, N) :-
	L is K+1,
	length_queue(Front, Back, L, N).



%   list_to_queue(List, Queue)
%   creates a new queue with the same elements as List.

list_to_queue(List, Front-Back) :-
	append(List, Back, Front).



%   queue_to_list(Queue, List)
%   creates a new list with the same elements as Queue.

queue_to_list(Front-Back, List) :-
	queue_to_list(Front, Back, List).

queue_to_list(Front, Back, Ans) :-
	Front == Back, !, Ans = [].
queue_to_list([Head|Front], Back, [Head|Tail]) :-
	queue_to_list(Front, Back, Tail).

