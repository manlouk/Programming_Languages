%diapragmateysi(Input,Moves):-


diapragmateysi(State,Moves):-initial(node(State,""),Moves).

%search_sol(node(State,Path),Moves):-initial(node(State,""),Q),bfs(Q,Set),write(Moves).


initial(node(State,Path),Moves):-make_queue(Q),join_queue(node(State,Path),Q,NQ),
			   empty_assoc(Empty_First),hash_term(State,Value),put_assoc(Value,Empty_First,State,Visited_nodes),
		           bfs(NQ,Visited_nodes,Moves).


	 	
bfs(Q,Visited,Moves):- head_queue(Q,node(State,Path)),
       		 \+ goal(State),
		 serve_queue(Q,node(State,Path),NQ),
       		 right_1(node(State,Path),node(NState1,NPath1)),add_state(NQ,NQ1,node(NState1,NPath1),Visited,Visited_1),
		 right_2(node(State,Path),node(NState2,NPath2)),add_state(NQ1,NQ2,node(NState2,NPath2),Visited_1,Visited_2),
         	 right_3(node(State,Path),node(NState3,NPath3)),add_state(NQ2,NQ3,node(NState3,NPath3),Visited_2,Visited_3),
	 	 right_4(node(State,Path),node(NState4,NPath4)),add_state(NQ3,NQ4,node(NState4,NPath4),Visited_3,Visited_4),
	 	 
	 	 
	 	  
	
	 bfs(NQ4,Visited_4,Moves).

bfs(Q,_,Path):-head_queue(Q,node(State,Path)),goal(State),!.


add_state(Q,NQ,node(State,Path),Visited,NVisited):-
	 hash_term(State,Value),get_assoc(Value,Visited,_) -> (NQ=Q,NVisited=Visited);
					(join_queue(node(State,Path),Q,NQ), hash_term(State,Value),put_assoc(Value,Visited,State,NVisited)).


%bfs(Q):-head_queue(Q,node(State,Path)),goal(State),write(Path).

goal("bgbGgGGrGyry").


	



%expand(Parent,Moves,ChildStates):-


right_1(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_1(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"1",NPath).

right_2(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_2(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"2",NPath).

right_3(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_3(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"3",NPath).

right_4(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_4(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"4",NPath).

roll_1([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X2,X1,X5,X0,X4,X3,X6,X7,X8,X9,X10,X11]).

roll_2([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X3,X2,X6,X1,X5,X4,X7,X8,X9,X10,X11]).

roll_3([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X1,X2,X3,X4,X7,X6,X10,X5,X9,X8,X11]).

roll_4([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X1,X2,X3,X4,X5,X8,X7,X11,X6,X10,X9]).

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


