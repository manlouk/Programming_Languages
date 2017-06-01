fun evenOdd([])=(0,0)
       | evenOdd(x::xs) =
                let
                 val (m,n) = evenOdd(xs)
                in 
                    if x mod 2 = 0 then (x+m,n)
                    else (m,x+n)
                end 
                    
