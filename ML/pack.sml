fun pack(L)=
        let fun pack'([],Y)=Y
                | pack'(x::xs,[[]])=pack'(xs,[[x]])
              (*  | pack'(x::xs,nil::hs)=pack'(xs,[x]::hs) *)
                | pack'(x::xs,(y::ys)::hs)=if x=y then pack'(xs,(x::y::ys)::hs) else pack'(xs,[x]::(y::ys)::hs)
          in
                pack'(L,[[]])
          end
                      
                       