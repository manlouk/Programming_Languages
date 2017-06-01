fun length(l:'a list):int =
        (case l of 
                nil => 0
                | x::xs => 1+length(xs));
