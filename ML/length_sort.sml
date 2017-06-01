fun placeInList(L:'a list,Y:'a list list)=
        let 
            fun placeIn(L,[],M)=M @ [L]
               | placeIn([],Y,M)=M @ Y
               | placeIn(L,Y::Ys,M)=
                if length(L)<length(Y) then placeIn(L,Ys,M @ [Y]) 
                                        else placeIn([],Y::Ys,M @ [L])
                                        
        in 
                placeIn(L,Y,[])
        end
                    
fun sort_length(L:'a list list)=
        let fun sortIn([] , R)=R
                | sortIn(X::Xs,R)=sortIn(Xs,placeInList(X,R))
         in 
                sortIn(L,[])
         end
     
     
                       
                                                    