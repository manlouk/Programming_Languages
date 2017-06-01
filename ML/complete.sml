datatype 'a tree = Empty 
                  | Node of ('a tree ) * 'a * ( 'a tree )

fun isComplete(Node(Empty,data,Empty))=true
        | isComplete(Node(Node(_,_,_),_,Node(_,_,_)))=true
        | isComplete(Node(L,data,R))=isComplete(L) andalso isComplete(R)                  
