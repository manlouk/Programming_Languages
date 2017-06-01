fun list_xor(L)=
        let fun list_xor'([],a,b)= if a mod 2 =1 then true else false
                | list_xor'(x::xs,a,b)=if x = true then list_xor'(xs,a+1,b) else list_xor'(xs,a,b+1)    
        in 
                list_xor'(L,0,0)
         end
                
        
