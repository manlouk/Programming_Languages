#include<cstdio>
#include<iostream>
#include<algorithm>
using namespace std;

int dp[43];
int sol[43];
int K[1001][43];

int main(){
    int N,M;
    cin>>N>>M;
    for(int i=0;i<M;i++){
        cin>>K[i][0];
        for(int j=1;j<=K[i];j++){
            cin>>K[i][j];
        }
    }


