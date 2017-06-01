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
     
fun pack(N,L)=
     let 
        fun  pack_same_length(0,L,M)=[]
          | pack_same_length(N,[],M)=M
          |  pack_same_length(N,X::Xs,M)=if length(X)=N then pack_same_length(N,Xs,X::M) else pack_same_length(N,Xs,M)
     in 
        pack_same_length(N,L,[])
     end    
           
fun frequency_sort(L)=
        let val S=sort_length(L)
        in 
                let fun sortIn([],R)=R
                        | sortIn(S::Ss,R)=sortIn(pack(length(S),M           
            
