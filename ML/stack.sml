structure RevStack = struct 
        type 'a stack = 'a list
        exception Empty 
        
        fun isEmpty(s:'a stack):bool=
                (case s of 
                        []=>true 
                        | _=>false)
        fun top(s:'a stack):'a=
               ( case s of 
                   [] => raise Empty
                   | x::xs => x)
        fun pop(s:'a stack):'a stack=
                (case s of 
                        [] =>raise Empty
                        | x::xs => xs)
        fun push(s:'a stack,x:'a):'a stack=x::s
        fun rev(s:'a stack)=rev(s)
end
                
                                                                 
