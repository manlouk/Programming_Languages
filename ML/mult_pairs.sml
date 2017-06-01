fun mult_pairs(L)=
        let fun mult_pairs([],M)=M
                | mult_pairs((x,y)::xs,M)=mult_pairs(xs,x*y::M)
         in 
               rev (mult_pairs(L,[]))
         end              
             
    
        
