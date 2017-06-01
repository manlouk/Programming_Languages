zeros_ones(n(X,Y,Z),Zs,Os):-find_ones(n(X,Y,Z),Ones),find_zeros(n(X,Y,Z),Zeros),make_list(Ones,Zeros,Z_L,O_L).
find_ones(0,0).
find_ones(1,1).
find_ones(n(X,Y,Z),Acc):-find_ones(X
