 fun ss1(nil, _) = true
     |   ss1(_, nil) = false
     |   ss1(x::xs, y::ys) = (x=y andalso ss1(xs,ys));
    
        
