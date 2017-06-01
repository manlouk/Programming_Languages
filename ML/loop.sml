fun min3(x:int,y:int,z:int):int=
        let fun min3'(x,y,z,max)=if(max<z)then min3'(x,y,z,z) 
                                else 
                                     if max<y then min3'(x,y,z,y) else max
        in
                min3'(x,y,z,x)                             
        end           
