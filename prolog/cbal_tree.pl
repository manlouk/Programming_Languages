cbal_tree(0,nil).
cbal_tree(1,t('x',nil,nil)).
cbal_tree(N,t('x',L,R)):-cbal_tree(N1,L),N is N1+1,cbal_tree(N2,R),N is N2+1.
