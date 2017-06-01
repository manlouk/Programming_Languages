fun fib (n) = let
fun fib_iter (0,a,b) = b
| fib_iter (n,a,b) = fib_iter (n-1,a+b,a)
in
fib_iter (n,1,0)
end
