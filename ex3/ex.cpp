#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<cstring>
using namespace std;

int sol[11][11][5][5];

int op(int a,int b,int i){
	double res;
         if(i==1)
	     res=a+b;
	else if(i==2)
	     res=a-b;
	else if(i==3)
	     res=a*b;
	else 
             res=double(a)/b;
     return res;
}

	


string number;
bool flag;
int main(){
	cin>>number;
        cout<<number.substr(0,1)<<"\n";
	}							
