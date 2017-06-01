fun xor_fold(L)=foldr(fn (a,b)=> if a = true then 
                                               if b = true then false 
                                                           else true
                                               else 
                                                  b ) false L 
           
             
    
        
