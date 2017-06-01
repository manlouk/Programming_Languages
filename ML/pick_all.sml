fun delete(el,L)=
        let fun find_and_delete(el,[],R)=rev(R)
                | find_and_delete(el,x::xs,R)=if el=x then rev(R)@xs 
                                                else find_and_delete(el,xs,x::R)
        in 
                find_and_delete(el,L,[])
        end                                                
fun pick_all(L)=
        let fun picks(L,[],R)=rev R
                | picks(L,y::ys,R)=picks(L,ys,(y,delete(y,L))::R)
         in 
                picks(L,L,[])
         end
                       
