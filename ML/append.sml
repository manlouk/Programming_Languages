fun append(nil,l)=l
| append(x::xs,l)=x::append(xs,l);
