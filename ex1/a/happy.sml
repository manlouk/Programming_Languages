open Array2
open List
open TextIO
val dp = array(10,1000,0)
datatype for = to of int * int
             | downto of int * int
infix to downto

val for =
    fn lo to up =>
       (fn f => let fun loop lo = if lo > up then ()
                                  else (f lo; loop (lo+1))
                in loop lo end)
     | up downto lo =>
       (fn f => let fun loop up = if up < lo then ()
                                  else (f up; loop (up-1))
                in loop up end)
fun rev (L)=
        let fun f'(nil,L)=L
                | f'(x::xs,ys)=f'(xs,x::ys)
          in
               f'(L,nil)
               end
                                     
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
fun comp(F,G,x)=F(G(x));
fun f(x)=sum_digits(simpleMap(fn x=>x*x,digits(x)));
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

fun cal(dp,x,prev,num)=
        let fun cal'(dp,0,0,count,prev)=if isHappy(prev) then count+Array2.sub(dp,x,0) else count
                | cal'(dp,i,0,count,prev)=if isHappy(i*i+prev) then cal'(dp,i-1,729,count+Array2.sub(dp,x,0),prev) else cal'(dp,i-1,729,count,prev)
                |      cal'(dp,i,j,count,prev)=if isHappy(i*i+j+prev) then cal'(dp,i,j-1,count+Array2.sub(dp,x,j),prev) else  cal'(dp,i,j-1,count,prev)
        in
                cal'(dp,(num div power(numDigits(num))-1),729,0,prev)
         end   
                             
                                  
fun recSol(num)=
  
   let fun recSol1(0,count,prev)=count
        | recSol1(num,count,prev)=
        if num < 10 then 
          if isHappy((num-1)*(num-1)+prev) then 
                case num of 
                      0 => count
                    | num => recSol1(num-1,count+1,prev)
          else recSol1(num-1,count,prev)   
       else 
           let val msb=num div power(numDigits(num))
           in 
                 recSol1(num mod (msb * power(numDigits(num))) , count+cal(dp,numDigits(num)-1,prev,num),hd(digits(num))*hd(digits(num))+prev)       
          end     
     in 
     recSol1(num,0,0)
     end
                                                   
(*fun init1()=
                  for(0 to 9) 
                        (fn j => Array2.update(dp,1,j*j,1))
*)
fun init1(10)=()
        | init1(j)=(Array2.update(dp,1,j*j,1);init1(j+1))
(*fun init2()=    
           ( for(1 to 9 )
                     (fn i=> for(0 to 729 ) 
                        (fn j => for(0 to 9 )
                            ( fn off => Array2.update(dp,i,j+off*off,Array2.sub(dp,i,j+off*off)+Array2.sub(dp,i-1,j))))))  
  *)
 fun init2(10,_,_)=()
        | init2(i,730,j)=init2(i+1,0,0)
        | init2(i,j,10)=init2(i,j+1,0)
        | init2(i,j,off)=(Array2.update(dp,i,j+off*off,Array2.sub(dp,i,j+off*off)+Array2.sub(dp,i-1,j));init2(i,j,off+1))
                                          
(*modified input function from previous year *)                
fun parse file =
    let
	(* A function to read an integer from specified input. *)
        fun readInt input = 
	    Option.valOf (TextIO.scanStream (Int.scan StringCvt.DEC) input)

	(* Open input file. *)
    	val inStream = TextIO.openIn file

        (* Read an integer (number of countries) and consume newline. *)

        (* A function to read N integers from the open file. *)
	fun readInts 0 acc = acc (* Replace with 'rev acc' for proper order. *)
	  | readInts i acc = readInts (i - 1) (readInt inStream :: acc)
    in
   	readInts 2 []
    end
fun main()=
    let
        val t= parse (hd(CommandLine.arguments())) 
        (*val infile = openIn(hd(CommandLine.arguments()))*)
        val b=hd(t)
        val a=hd(tl(t))
        val _ = init1(0)
        val _=init2(1,0,0)
      val l=a
      val h=b
      val solL=recSol(l)
        val solH=recSol(h)
    (*  val d=digits(Option.valOf (Int.fromString a))
      val result=sum_digits(simpleMap(fn x=>x*x,d))
      val h=isHappy(result)
      *)
    in
                if l=1 then 
                        if isHappy(h) then print(Int.toString(solH+1)^"\n") else print(Int.toString(solH)^"\n")
                else
                        if isHappy(h) then  print(Int.toString(solH+1-solL)^"\n") else     print(Int.toString(solH-solL)^"\n")
                 
   end
val _ = main()


