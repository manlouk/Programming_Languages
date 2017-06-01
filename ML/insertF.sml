fun insertF(L,a)=
        let fun insert([],M)=M
                | insert(nil::xs,M)=insert(xs,[a]::M)
                | insert((x::xs)::XS,nil::YS)=insert(XS,(a::x::xs)::YS)
                | insert((x::xs)::XS,M)=insert(XS,(a::x::xs)::M)
        in
               rev (insert(L,[]))
        end
                        
       
