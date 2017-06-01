open Array2
val dp=array(10,730,1)


fun digits(x:int):int list=
  let
    fun digitIn(x:int,acc:int list):int list=
      (case x of
            0 =>acc
          | x =>digitIn(x div 10,(x mod 10)::acc))
  in
  
    digitIn(x,nil)
end


fun simpleMap(F,nil)=nil
  | simpleMap(F,x::xs)=F(x)::simpleMap(F,xs)
  
  
fun sum_digits(nil)=0
  | sum_digits(x::xs)=x+sum_digits(xs)
  
fun comp(F,G,x)=F(G(x))

fun f(x)=sum_digits(simpleMap(fn x=>x*x,digits(x)))
fun isHappy(x:int)=
  let
    fun isHappy1(1,_)=true
      | isHappy1(_,1)=true
      | isHappy1(x,y)=if x=y then false else
       isHappy1(f(x),comp(f,f,y))
  in
    isHappy1(x,comp(f,f,x))
  end
fun power(x)=
        let fun power1(x,acc)=
                case x of 
                        1 => acc
                        | x => power1(x-1,acc*10)
       in 
               power1(x,1)
       end
                                          
fun numDigits(num)=
        let fun numDigits1(num ,count) = 
                if num>=10 then numDigits1((num div 10 ), count+1)
                else  count
        in
             numDigits1(num,1)
         end 

fun cal(dp,msb,numD,prev)=
        let fun cal'(dp,0,0,count,prev)=if isHappy(prev) then count+Array2.sub(dp,numD-1,0) else count
                | cal'(dp,msb,0,count,prev)=if isHappy(msb*msb+prev) then cal'(dp,msb-1,729,count+Array2.sub(dp,numD-1,0),prev) else cal'(dp,numD-1,729,count,prev)
                |      cal'(dp,msb,j,count,prev)=if isHappy(msb*msb+j+prev) then cal'(dp,msb,j-1,count+Array2.sub(dp,numD-1,j),prev) else  cal'(dp,msb,j-1,count,prev)
        in
                cal'(dp,msb-1,729,0,prev)
         end 
         

