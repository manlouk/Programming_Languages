datatype  'data tree = Empty | Node of ( 'data tree ) * 'data * ( 'data tree )

  fun append_all(Node(Empty,data,Empty))=data
       | append_all(Node(L,data,R)) = append_all(L)@append_all(R)@data
        
