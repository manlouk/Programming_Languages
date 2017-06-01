fun f(x)=
  if (x<0) then f(x+1)
  else
    let
      val g(y)=
        if (y<0) then g(y+1)
        else g(y-1)
    in
      g(8)
   f(x-1)

