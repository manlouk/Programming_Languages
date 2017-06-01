fun extract(L,a)=
        let 
                fun extract'([],M,Y)=M
                        | extract'(x::xs,M,[])=extract'(xs,M,rev L)
                        | extract'(x::xs,M,y::ys)=if x = y then extract'(x::xs,M,ys) else extract'(x::xs,[x,y]::M,ys)
        in
                extract'(L,[],rev L)
        end                        
             
    
        
