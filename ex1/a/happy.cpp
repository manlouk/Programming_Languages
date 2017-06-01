#include<cstdio>
#include<iostream>
#include<fstream>
#include<ctime>
using namespace std;
int ha[1001];
int sum_digit_squares(long a){
        int s=0;
       // clock_t t=clock();

        for(long k=a;k!=0;k/=10){
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


bool ishappy(long a){
     long a1,a2;
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
int main(int argc,char *argv[]){
    long happies,L,H;
    //int x;
    ifstream fin;
   // fin.open(argv[1]);
    //A=argv[1]-'0';B=argv[2]-'0';
    cin>>L>>H;
    //int c_a=count_digits(A);
    //int c_b=count_digits(B);
    happies=0;
    for(long i=0;i<=1001;i++){ha[i]=0;}
    for(long  i=1;i<=1001;i++){
        if(ishappy(i)){ha[i]=1;}
    }

    bool flag = false;
    int i,j,k,l,p,h,g,f,r,m;
    for( i=0;i<10;i++){
        for( j=0;j<10;j++){
            for( k=0;k<10;k++){
                for( l=0;l<10;l++){
                    for( p=0;p<10;p++){
                        for( h=0;h<10;h++){
                            for( g=0;g<10;g++){
                                for( f=0;f<10;f++){
                                    for( r=0;r<10;r++){
                                        for( m=0;m<10;m++){
                                        long
                                            a=i*1000000000+j*100000000+k*10000000+l*1000000+p*100000+h*10000+g*1000+f*100+10*r+m;
                                     //   cout<<i*1000000000+j*100000000+k*10000000+l*1000000+p*10000+h*1000+g*100+f*10+r<<"\n";
                                        if(a<L)continue;
                                        else{
                                            //cout<<a<<"\n";
                                            if(a>H){flag=true;break;}
                                           //if(i*1000000000+j*100000000+k*10000000+l*1000000+p*10000+h*1000+g*100+f*10+r>H)continue;
                                                  if(ha[i*i+j*j+k*k+l*l+p*p+h*h+g*g+f*f+r*r+m*m]==1){
                                                     happies++;}}

                                }if(flag)break;

                            }if(flag)break;
                                                        }if(flag)break;
                                                }if(flag)break;
                                        }if(flag)break;

            }if(flag)break;
                }
        }if(flag)break;
    }if(flag) break;
    }
cout<<happies<<"\n";
}

