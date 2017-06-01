fun last_but_one(l:'a list):'a =
        (case l of 
                x::_::nil => x
                | _::xs => last_but_one(xs));
                
