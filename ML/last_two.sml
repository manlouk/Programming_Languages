fun last_two(l:'a list):'a list =
(case l of
        x::y::nil => [x,y]
        | x::xs => last_two(xs));
