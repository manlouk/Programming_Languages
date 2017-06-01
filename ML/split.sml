fun split(L,k)=
        let fun split'(L,M,0)=(rev(M),L)
                | split'([],M,_)=([],rev(M))
                | split'(x::xs,M,k)=split'(xs,x::M,k-1)
        in
                split'(L,[],k)
         end
                        
                
                      
