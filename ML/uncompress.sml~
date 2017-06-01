fun uncomp(L:int list ):int list=
    let
      fun uncompIn([],M)=M
        | uncompIn(x::xs,[])=uncompIn(xs,[x])
        | uncompIn([a],y::ys)=if (a=y) then uncompIn([],y::ys)
                              else uncompIn([],a::y::ys)
        | uncompIn(x::xs,y::ys)=if x=y then uncompIn(xs,y::ys)
                                else uncompIn(xs,x::y::ys);
    in
      rev(uncompIn(L,[]))
    end;


