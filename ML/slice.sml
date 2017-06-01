fun slice(L,i,j)=
        let fun slice'(_,M,0,0)=rev(M)
                | slice'(x::xs,M,0,j)=slice'(xs,x::M,0,j-1)
                | slice'(x::xs,M,i,j)=slice'(xs,M,i-1,j-1) 
         in
                slice'(L,[],i,j)
          end
                
                  
