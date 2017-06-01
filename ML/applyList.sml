fun applyList([],a)=nil 
  | applyList(f::fs,a) = f(a) :: applyList(fs,a) 
