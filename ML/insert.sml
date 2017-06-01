fun insert(L,a)=map (fn x => a::x) L
fun append(nil,l)=l
| append(x::xs,l)=x::append(xs,l);
fun powerset(L)=
        let fun powerset'([],M,[])=M
         powerset'([],M,y::ys)=powerset'([],append(insert(M,y),M),ys)
                | powerset'(x::xs,M,y::ys)=powerset'(xs,[x]::M,y::ys)
         in 
                powerset'(L,[[]],L)
         end          
        