datatype 'a tree = Empty | 
                   Node of ('a tree)*'a*('a tree)
fun append_all(Node(left,L,right))=
       let fun append'(Empty,M)=M
                | append'(Node(left,[],right),M)=Node(append'(left,M),[],append'(right,M))
                | append'(Node(left,x::xs,right),M)=Node (append'(left,x::M),xs,append'(right,x::M))                  
        in      
                append'(Node (left,L,right),[])
         end
                           
                   
