fun compress(L:'a list):'a list=
    let
      fun compIn([],M)=M
        | compIn([x],M)=compIn(nil,x::x::M)
        | compIn(x::xs,M)=compIn(xs,x::x::M)
    in
     rev( compIn(L,[]))
    end;


