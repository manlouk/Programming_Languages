fun max_pairs(L)=foldr( fn ((a,b),c) => if a>b then a::c else b::c) [] L
           
             
    
        
