fun reverse(l:'a list):'a list =
     let 
        fun rev(l:'a list,acc:'a list):'a list =
                (case l of 
                          nil => acc
                        | x::xs => rev(xs,x::acc))
         in 
                rev(l,nil)
                               
end        
