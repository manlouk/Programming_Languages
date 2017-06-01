#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<fstream>
using namespace std;

int dp[10][1001];
int digits[10];
long count_sol;
int sum_digit_squares(int a){
        int s=0;
       // clock_t t=clock();

        for(int k=a;k!=0;k/=10){
            int m=k%10;
       //   if(a%10==0){a/=10;continue;}
          s=s+m*m;
         // if(h[s]==1)break;

         }
        //t=clock()-t;
        //cout<<((float)t)/CLOCKS_PER_SEC<<"\n";
              //  s+=a*a;
        return s;
}
bool ishappy(int a){
     int a1,a2;
            //bool flag=true;
     a1=a;a2=a;
     while(true){
      a1=sum_digit_squares(a1);
                                   // cout<<a1<<"\n";
      if(a1==1){
        return true;}

      a2=sum_digit_squares(a2);
      a2=sum_digit_squares(a2);
                                                                       // cout<<a2<<"\n";
      if(a2==1)
          return true;
      else{
         if(a2==a1)
            {return
                false;}
        }
     }

}
int numDigits(long long int num) {
  int count = 1;
  while (num >= 10) {
    num /= 10;
    count++;
  }
  return count;
}
void find_digits(long num){
        int numD=numDigits(num);
        for(int i=0;i<=numD;i++)digits[i]=0;
        int i=1;
        if(num>10){
        while(num>10){
                digits[i++]=num%10;
                  num/=10;
                }
                digits[i++]=num;
         }
         else digits[1]=num;       
         // for(int i=0;i<numD;i++){cout<<digits[i]<<"\n";}      
   }
               
void RecSol(long num,int prev){
 int numD=numDigits(num);
 //cout<<"prev="<<prev<<"\n";
// cout<<"num= "<<num<<"\n";
       if(num<10){
            // prev+=digits[0]*digits[0];
                for(int j=0;j<num;j++){ 
                        if(ishappy(j*j+prev))count_sol+=1;}
                        //return count_sol; 
                        }
        
        long acc=1;
        for(int i=0;i<numD-1;i++)acc*=10;
        int MSB=(int)(num/acc);
        for(int i=0;i<MSB;i++){
                for(int j=0;j<730;j++){
                        if(ishappy(i*i+j+prev))count_sol+=dp[numD-1][j];
                }
        }
     //   cout<<"count= " <<count<<"\n";
      
        prev+=digits[numD]*digits[numD];
        if(num%(MSB*acc)>0)
         RecSol(num%(MSB*acc),prev);
       // return count_sol; 
      
        
            // prev+=digits[0]*dig
  }
                         
ifstream fin;

int main(int argc,char *argv[]){
    long H,L;
    fin.open(argv[1]);
    fin>>L>>H;
    for(int i=1;i<10;i++){
        for(int j=0;j<=i*9*9;j++){
            dp[i][j]=0;}}

    for(int j=0;j<=9;j++)dp[1][j*j]=1;
    for(int i=1;i<10;i++){
        for(int j=0;j<=i*9*9;j++){
            for(int off=0;off<10;off++){
                dp[i][j+off*off ]+=dp[i-1][j];}}}
/*for(int i=1;i<10;i++){
        for(int j=0;j<=i*9*9;j++){
        cout<<"dp["<<i<<"]"<<"["<<j<<"]"<<"="<<dp[i][j]<<"\n";}}
   
    for(int i=0;i<numD-1;i++)acc*=10;
   // cout<<numD<<"\n";
   int MSB=(int)( H/acc);
   for(int i=0;i<MSB;i++){
    for(int j=0;j<730;j++){
                if(ishappy(j+i*i)){
                    //    cout<<j<<"+"<<i<<"^2"<<"="<<j+i*i<<" "<<" dp["<<numD-1<<"]"<<"["<<j+i*i<<"]"<<"="<<dp[numD-1][j+i*i]<<"\n";
                        count+=dp[numD-1][j];}}
                        }
         */ 
           long countH;
            long countL;
            find_digits(H);
            count_sol=0; 
            RecSol(H,0);
           countH=count_sol;
           count_sol=0;
           find_digits(L);
           
           RecSol(L,0);
           countL=count_sol;
           if(ishappy(H)) countH+=1;
           //if(ishappy(L)) countL+=1;
           if(L==1){
                //if(ishappy(H)) countH+=1;
           
         cout<<countH<<"\n";
         }
         else{
                
               
                cout<<countH-countL<<"\n";}
       // cout<<count<<"\n";
     // cout<<countH<<" "<<countL<<"\n";   
      /* for(int j=0;j<730;j++){
          
                if(ishappy(j+4)) cout<<j<<"+"<<4<<" dp["<<2<<"]"<<"["<<j+4<<"]"<<"="<<dp[2][j]<<"\n";}
        */
          }


