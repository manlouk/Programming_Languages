open TextIO;
fun readList(stdIn)=
    if endOfStream(stdIn) then nil
    else inputN(Int.toString(stdIn),1)::readList(stdin);


fun palindrome ( l: int list ):bool =
      l=readList(stdIn);
      l=rev(l);

