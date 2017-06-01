#include<cstdio>
#include<iostream>
using namespace std;
int S[10][730];

int main(){
        long L,H;
        cin>>L>>H;
        for(int i=1;i<10;i++){
                for(int j=1;j<=(i-1)*9*9;j++) S[i][j]=1;}
       for(int j=1;j<=9;j++)S[1][j*j]=1;
               
   for(int i=2;i<10;i++){                     
   for (int j=1; j<=(i-1)*9*9; j++){
    for(int offset=0; offset<10; offset++){
        S[i][j+offset*offset] += S[i-1][j+offset*offset]; 
    }
}
            }
       cout<<S[4][1]<<"\n";
            
}                               
