fun pack (k,[]) = []
    | pack (0,x::xs) = []
    | pack (k, x::xs) = x::pack (k-1 ,xs)


fun     windows(k,x::xs) = if length(x::xs)>=k then pack(k,x::xs)::windows(k,xs) else  pack(k,[])
                                                            
