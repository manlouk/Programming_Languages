fun map f xs = foldr (fn (x,z) => (f x) :: z) [] xs
