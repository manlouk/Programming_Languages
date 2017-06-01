structure Test =
struct

fun main (prog_name, args) =
    let
      val _ = print ("Program name: " ^ prog_name ^ "\n")
      val _ = print "Arguments:\n"
      val _ = map (fn s => print ("\t" ^ s ^ "\n")) args
    in
      1
    end
end
