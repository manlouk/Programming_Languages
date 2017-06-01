fun sublist([],R,LeftList)= (List.rev R,List.rev LeftList)
        | sublist(x::xs,[])=sublist(xs,[x],xs)
        | sublist(x::xs,y::ys,LeftList)=if x-y=1 orelse y-x=1 then sublist(xs,x::y::ys,LeftList) else (List.rev (y::ys),(x::xs)@LeftList)

(*fun incSeqs(L)=
        let fun seqs([],R)=R
                | seqs(x::xs,R)=seqs((#2 sublist(x::xs,[],x::xs)),((#1 sublist(x::xs,[],x::xs)))::R)
        in
                seqs(L,[])
        end
  *)                              
        
