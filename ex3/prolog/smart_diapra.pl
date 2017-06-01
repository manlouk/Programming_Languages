
diapragmateysi(State,Moves):-initial(node(State,""),Moves,State).

%goal_left(State).
%search_sol(node(State,Path),Moves):-initial(node(State,""),Q),bfs(Q,Set),write(Moves).


initial(node(State,Path),Moves,Goal_left):-	
		make_queue(Q_left),make_queue(Q_right),join_queue(node(State,Path),Q_right,NQ_right),join_queue(node("bgbGgGGrGyry",""),Q_left,NQ_left),empty_assoc(Empty_right),empty_assoc(Empty_left),put_assoc("",Empty_right,State,Visited_right),put_assoc("",Empty_left,"bgbGgGGrGyry",Visited_left),
bfs(NQ_left,NQ_right,Visited_left,Visited_right,Moves,Goal_left).


	 	


bfs(Q_l,Q_r,Visited_l,Visited_r,Moves,Goal_left):- serve_queue(Q_r,node(State_r,Path_r),NQ_r),
%write("Right:"),tab(1),write(State_r),tab(1),write(Path_r),nl,
       		 right_1(node(State_r,Path_r),node(NState_r,NPath_r)),add_state_right(NQ_r,NQ_r1,node(State_r,Path_r),node(NState_r,NPath_r),Visited_r,Visited_r1,Visited_l,"bgbGgGGrGyry"),
		 right_2(node(State_r,Path_r),node(NState_r2,NPath_r2)),add_state_right(NQ_r1,NQ_r2,node(State_r,Path_r),node(NState_r2,NPath_r2),Visited_r1,Visited_r2,Visited_l,"bgbGgGGrGyry"),
         	 right_3(node(State_r,Path_r),node(NState_r3,NPath_r3)),add_state_right(NQ_r2,NQ_r3,node(State_r,Path_r),node(NState_r3,NPath_r3),Visited_r2,Visited_r3,Visited_l,"bgbGgGGrGyry"),
	 	 right_4(node(State_r,Path_r),node(NState_r4,NPath_r4)),add_state_right(NQ_r3,NQ_r4,node(State_r,Path_r),node(NState_r4,NPath_r4),Visited_r3,Visited_r4,Visited_l,"bgbGgGGrGyry"),
		serve_queue(Q_l,node(State_l,Path_l),NQ_l),
		%write("Left:"),tab(1),write(State_l),tab(1),write(Path_l),nl,
		left_1(node(State_l,Path_l),node(NState_l1,NPath_l1)),add_state_left(NQ_l,NQ_l1,node(State_l,Path_l),node(NState_l1,NPath_l1),Visited_l,Visited_l1,Visited_r4,Goal_left),
		 left_2(node(State_l,Path_l),node(NState_l2,NPath_l2)),add_state_left(NQ_l1,NQ_l2,node(State_l,Path_l),node(NState_l2,NPath_l2),Visited_l1,Visited_l2,Visited_r4,Goal_left),
		 left_3(node(State_l,Path_l),node(NState_l3,NPath_l3)),add_state_left(NQ_l2,NQ_l3,node(State_l,Path_l),node(NState_l3,NPath_l3),Visited_l2,Visited_l3,Visited_r4,Goal_left),
		 left_4(node(State_l,Path_l),node(NState_l4,NPath_l4)),add_state_left(NQ_l3,NQ_l4,node(State_l,Path_l),node(NState_l4,NPath_l4),Visited_l3,Visited_l4,Visited_r4,Goal_left),bfs(NQ_l4,NQ_r4,Visited_l4,Visited_r4,Moves,Goal_left).




add_state_right(Q,NQ,node(State_r,_),node(NState,NPath),Visited_r,NVisited_r,Visited_l,Goal):-
	%write(NState),nl,
	 (gen_assoc(NState,Visited_r,_) -> (NQ=Q,NVisited_r=Visited_r);
					(get_assoc(NState,Visited_l,_)->(put_assoc(NState,Visited_r,State_r,NVisited_r),find_Path_left(Visited_r,node(NState,NPath),Goal));(join_queue(node(NState,NPath),Q,NQ),put_assoc(NState,Visited_r,State_r,NVisited_r)))).

add_state_left(Q,NQ,node(State_l,_),node(NState,NPath),Visited_l,NVisited_l,Visited_r,Goal):-
	(get_assoc(NState,Visited_l,_) -> (NQ=Q,NVisited_l=Visited_l);
					(get_assoc(NState,Visited_r,_)->(put_assoc(NState,Visited_l,State_l,NVisited_l),find_Path_right(Visited_r,node(NState,NPath),Goal));(join_queue(node(NState,NPath),Q,NQ),put_assoc(NState,Visited_l,State_l,NVisited_l)))).

%bfs(Q):-head_queue(Q,node(State,Path)),goal(State),write(Path).




find_Path_left(_,node(Goal,Path),Goal):-terminate(Path).

find_Path_left(Visited,node(Parent,Path),Goal):-
	%write(Visited),nl,
	%write("ith"),tab(1),write(Parent),nl,break,
	(gen_assoc(Child,Visited,Parent),write(Child),nl,break,
	(right_1(node(Parent,Path),node(Child,NPath))-> (write(1),nl,find_Path_left(Visited,node(Child,NPath),Goal));
	(right_2(node(Parent,Path),node(Child,NPath))-> (write(2),nl,find_Path_left(Visited,node(Child,NPath),Goal));
	(right_3(node(Parent,Path),node(Child,NPath))-> (write(3),nl,find_Path_left(Visited,node(Child,NPath),Goal));
	(right_4(node(Parent,Path),node(Child,NPath))-> (write(4),nl,find_Path_left(Visited,node(Child,NPath),Goal))))))).
	

%expand(Parent,Moves,ChildStates):-

find_Path_right(_,node(Goal,Path),Goal):-terminate(Path).

find_Path_right(Visited,node(Parent,Path),Goal):-
	%write("ith"),tab(1),write(Path),nl,break,
	%write(Visited),nl,	
	(gen_assoc(Child,Visited,Parent),write(Child),nl,break,
	(left_1(node(Parent,Path),node(Child,NPath)) -> find_Path_right(Visited,node(Child,NPath),Goal);
	(left_2(node(Parent,Path),node(Child,NPath)) -> find_Path_right(Visited,node(Child,NPath),Goal);
	(left_3(node(Parent,Path),node(Child,NPath)) -> find_Path_right(Visited,node(Child,NPath),Goal);
	(left_4(node(Parent,Path),node(Child,NPath)) -> find_Path_right(Visited,node(Child,NPath),Goal)))))).

terminate(Path):-write(Path).


right_1(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r1(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"1",NPath).

right_2(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r2(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"2",NPath).

right_3(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r3(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"3",NPath).

right_4(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_r4(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"4",NPath).

left_1(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l1(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"1",NPath).

left_2(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l2(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"2",NPath).

left_3(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l3(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"3",NPath).

left_4(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_l4(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"4",NPath).





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

