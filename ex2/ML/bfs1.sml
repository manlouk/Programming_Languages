open Array
open HashTable
datatype 'a seq = Nil | Cons of 'a * (unit -> 'a seq )
fun convertToString(arr)=
        let fun conv(arr,n,L)= if n = Array.length(arr) then implode(rev(L)) else
                conv(arr,n+1,sub(arr,n)::L)
         in
                conv(arr,0,[])
          end 

fun roll(a,0) =convertToString(a)
    | roll(a,1)=
         
          
                (let
                    val tmp1 = sub(a,0)
                    val tmp2 = sub(a,3)       
                    val tmp3 = sub(a,5)
                in
                     update(a,0,sub(a,2)); 
                     update(a,3,tmp1);
                     update(a,5,tmp2);
                     update(a,2,tmp3)
                 end ;
                
                        roll(a,0))
                        
          | roll(a,2)=( 
                       let 
                           val tmp1 = sub(a,1)
                           val tmp2 = sub(a,4)       
                           val tmp3 = sub(a,6)
                       in 
                           update(a,1,sub(a,3));
                           update(a,4,tmp1);
                           update(a,6,tmp2);
                           update(a,3,tmp3)
                        end;roll(a,0))                   
          | roll(a,3)=( 
                        let 
                           val tmp1 = sub(a,5)
                           val tmp2 = sub(a,8)       
                           val tmp3 = sub(a,10)
                        in
                           update(a,5,sub(a,7));
                           update(a,8,tmp1);
                           update(a,10,tmp2);
                           update(a,7,tmp3)
                        end;roll(a,0))                   
          | roll(a,4) =(         
                        let 
                           val tmp1 = sub(a,6)
                           val tmp2 = sub(a,9)       
                           val tmp3 = sub(a,11)
                        in
                           update(a,6,sub(a,8));
                           update(a,9,tmp1);
                           update(a,11,tmp2);
                           update(a,8,tmp3)
                        end;roll(a,0)) 
fun head (Cons(x,_)) = x;
fun tail (Cons(_,xf)) = xf ();
fun isEqual (x: (string * string )) =  String.compare((#1 x),"bgbGgGGrGyry")=EQUAL 
fun filterq p Nil = Nil
  | filterq p (Cons(x,xf)) =
      if p x then Cons(x, fn()=> filterq p (xf()))
	     else filterq p (xf());
	     
val hashFunction = HashString.hashString;
val myHashTable : (string, string) HashTable.hash_table = 
         HashTable.mkTable (hashFunction, op=) (1000, Fail "NOT_FOUND");
val _ = HashTable.insert myHashTable( "rbrGbGyGGgyg","rbrGbGyGGgyg")    	     
fun rollstring(str,i)=
		roll(fromList(explode str ),i)		     
fun get 0 s = []
    | get n Nil = []
    | get n (Cons(x, xf)) = x :: get (n-1) (xf ());
fun next (s: (string * string)) =
          let 
             fun next' (5,L: (string * string ) list )=L
                | next'(i,L)=
                      let 
                        val ch_i=rollstring((#1 s),i)
                        val k = (ch_i,(#2 s)^Int.toString(i))
                      in
                         if HashTable.find myHashTable ch_i = NONE then  (HashTable.insert myHashTable(ch_i,ch_i);next'(i+1,k::L))
                else next'(i+1,L)
                end
           in 
               next'(1,[])
           end          
fun breadth next root =
    let fun f [] = Nil
          | f (x::xs) =   Cons(x, fn () => f (xs @ next x))
    in f [root] 
    end


