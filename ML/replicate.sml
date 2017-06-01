fun replicate(L,k)=
        let fun replicate'([],_,Y)=Y
                | replicate'(x::xs,1,Y)=replicate'(xs,k,x::Y)
                | replicate'(x::xs,k,Y)=replicate'(x::xs,k-1,x::Y)
         in
                replicate'(L,k,[])
         end
                      
