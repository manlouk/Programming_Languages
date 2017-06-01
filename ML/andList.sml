open List 
fun andList(L)=
        List.foldr ( fn (x,y) => x andalso y ) true L
