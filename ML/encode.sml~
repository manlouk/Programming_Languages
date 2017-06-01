fun encode(L)=
        let fun encode'([],Y)=Y
                | encode'(x::xs,[])=encode'(xs,[(1,x)])
                | encode'(x::xs,(k,y)::ys)=if y=x then encode'(xs,(k+1,y)::ys) else encode'(xs,(1,x)::(k,y)::ys)
         in
               encode'(L,[])
         end
                       
