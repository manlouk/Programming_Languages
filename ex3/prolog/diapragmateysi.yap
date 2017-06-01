%diapragmateysi(Input,Moves):-


%diapragmateysi(State,Moves):-search_solution(node(State,""),Moves).

%search_sol(node(State,Path),Moves):-initial(node(State,""),Q),bfs(Q,Set),write(Moves).


initial(node(State,Path),Q):-make_queue(Q),add_queue(node(State,Path),Q,NQ),bfs(NQ).

bfs(Q):-head_queue(Q,node(State,Path)),\+ goal(State),remove_queue(Q,node(State,Path),NQ),right_1(node(State,Path),Ch_1),right_2(node(State,Path),Ch_2),right_3(node(State,Path),Ch_3),right_4(node(State,Path),Ch_4),add_queue(Ch_1,NQ,NNQ),add_queue(Ch_2,NNQ,NNQ),add_queue(Ch_3,NNQ,NNQ),add_queue(Ch_4,NNQ,NNQ),bfs(NNQ).

bfs(Q):-head_queue(Q,node(State,Path)),goal(State),write(Path).

%goal("bgbGgGGrGyry").


	



%expand(Parent,Moves,ChildStates):-


right_1(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_1(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"1",NPath).

right_2(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_2(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"2",NPath).

right_3(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_3(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"3",NPath).

right_4(node(State,Path),node(NState,NPath)):-string_codes(State,Codes),roll_4(Codes,NCodes),string_codes(NState,NCodes),string_concat(Path,"4",NPath).

roll_1([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X2,X1,X5,X0,X4,X3,X6,X7,X8,X9,X10,X11]).

roll_2([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X3,X2,X6,X1,X5,X4,X7,X8,X9,X10,X11]).

roll_3([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X1,X2,X3,X4,X7,X6,X10,X5,X9,X8,X11]).

roll_4([X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11],[X0,X1,X2,X3,X4,X5,X8,X7,X11,X6,X10,X9]).



empty_queue([]).

    % member_queue tests if an element is a member of a queue

member_queue(E, S) :- member(E, S).

    % add_to_queue adds a new element to the back of the queue

add_queue(E, [], [E]).
add_queue(E, [H|T], [H|Tnew]) :- add_queue(E, T, Tnew).

    % remove_from_queue removes the next element from the queue
    % Note that it can also be used to examine that element 
    % without removing it
head_queue(H,[H|T]).   
remove_queue(E, [E|T], T).

append_queue(First, Second, Concatenation) :- 
    append(First, Second, Concatenation).
