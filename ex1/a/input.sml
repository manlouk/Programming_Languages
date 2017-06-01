open TextIO

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
fun printList nil = ()
        |   printList(x::xs)=( print(Int.toString(x));print(" ");printList(xs))    
fun main()=
        let 
                val t= parse (hd(CommandLine.arguments()))    
                val b = hd(t)
                val a= hd(tl(t))
        in 
                print(Int.toString(b))
                        end
val _ = main()                         
