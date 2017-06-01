open List
fun decode(L)=
        let fun decode'([],Y)=Y
                | decode'((1,x)::xs,Y)=decode'(xs,x::Y)
                | decode'((k,x)::xs,Y)=decode'((k-1,x)::xs,x::Y)
        in 
                rev decode'(L,[])
        end                
