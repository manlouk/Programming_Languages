#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<string>
#include<set>
#include<cmath>
using namespace std;
string  number;
set<double>solved_set[11];
set<double>::iterator t,r;


set<double>calculate(int start,int end){
	long val = atoi(number.substr(start,end-start+1).c_str());
	solved_set[end-start+1].insert(val);
	if(start-end==0){
		solved_set[1]=val;
		return solved_set[1];
	}
	for(int i=start;i<=end;i++){
		solved_set[i-start+1]=calculate(start,i);
		solved_
		long x_l=atoi(number.substr(start,i-start+1).c_str());
		long x_r=atoi(number.substr(i+1,end-i).c_str());
		solved_set[end-start+1].insert(x_l+x_r);
		solved_set[end-start+1].insert(x_l-x_r);
		solved_set[end-start+1].insert(x_l*x_r);
		if(x_r!=0) 
			solved_set[end-start+1].insert((double)x_l/x_r);			
}
return solved_set[end-start+1];
}
//string  number;

//pair<set<tr>::iterator,set<tr>::iterator > t;
bool flag=0;
int main(){
	cin>>number;
	int end=number.size()-1;
	
	   for(int i=0;i<=end;i++){ 
            	set<double>res1=calculate(0,i);
		set<double>res2=calculate(i+1,end);
		for(t=res1.begin();t!=res1.end();++t){
			for(r=res2.begin();r!=res2.end();++r){
				if(abs((*r)+(*t)-100)<0.001){flag=1;cout<<*r<<" "<<*t<<endl;break;}
				if(abs((*t)-(*r)-100)<0.001){flag=1;cout<<*r<<" "<<*t<<endl;break;}
				if(abs((*t)*(*r)-100)<0.001){flag=1;cout<<*r<<" "<<*t<<endl;break;}
				if(abs((*t)/(*r)-100)<0.001){flag=1;cout<<*r<<" "<<*t<<endl;break;}
				
			//cout<<*t<<endl;
			}
	      }
	}
cout<<flag<<endl;
}		

