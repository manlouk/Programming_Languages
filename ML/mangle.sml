fun mangle(f,g,L)=
        let fun mangleIn([],prev_f,prev_g,R)=rev(R)
                | mangleIn(x::y::ys,prev_f,prev_g,R)=mangleIn(ys,f o prev_f,g o prev_g,g(prev_g y)::f(prev_f x)::R)
        in 
           mangleIn(L,fn x =>x,fn x =>x,[])
        end                
