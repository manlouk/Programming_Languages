import java.util.*;
import java.io.*;
public class validator {
 public static class Situation{
          private  String s;
          private  String move;
        public Situation(String s,String move){
                this.s= new String(s);
                this.move=new String(move);
                }
       }
  public static char[] Roll_right(char[] str,int i){
        char tmp1,tmp2,tmp3;
        if(i==1){
                tmp1=str[0];
                str[0]=str[2];
                str[2]=str[5];
                str[5]=str[3];
                str[3]=tmp1;
                
                
                
              }
          else if (i==2){
                tmp1=str[1];
                tmp2=str[4];
                tmp3=str[6];
                str[1]=str[3];
                str[3]=str[6];
                str[4]=tmp1;
                str[6]=tmp2;
                
                }
           else if(i==3){
                tmp1=str[5];
                tmp2=str[8];
                tmp3=str[10];
                str[5]=str[7];
                str[8]=tmp1;
                str[10]=tmp2;
                str[7]=tmp3; 
              }
           else{
                tmp1=str[6];
                tmp2=str[9];
                tmp3=str[11];
                str[6]=str[8];
                str[9]=tmp1;
                str[11]=tmp2;
                str[8]=tmp3; 
              }
              return str;
          }                   
  public static char[] Roll_left (char[] str,int i){
        char tmp1,tmp2,tmp3;
        if(i==1){
                tmp1=str[0];
                tmp2=str[3];
                tmp3=str[5];
                str[0]=str[3];
                str[3]=str[5];
                str[5]=str[2];
                str[2]=tmp1;
              }
          else if (i==2){
                tmp1=str[1];
                tmp2=str[4];
                tmp3=str[6];
                str[1]=str[4];
                str[4]=str[6];
                str[6]=str[3];
                str[3]=tmp1;
                }
           else if(i==3){
                tmp1=str[5];
                tmp2=str[8];
                tmp3=str[10];
                str[5]=str[8];
                str[8]=str[10];
                str[10]=str[7];
                str[7]=tmp1; 
              }
           else{
                tmp1=str[6];
                tmp2=str[9];
                tmp3=str[11];
                str[6]=str[9];
                str[9]=str[11];
                str[11]=str[8];
                str[8]=tmp1; 
              }
            return str;  
         }     
       public static void main(String[] args){
                        char[] S=new char[18];
                        char [] c=new char[13];
                        
                        Scanner in = new Scanner(args[0]);
                        String input=new String(in.nextLine());
                        String correct = new String("gGrGgrGyGbyb");
                        S=input.toCharArray();
                        c=correct.toCharArray();
                     
                                System.out.println(S[1]);
                               c=Roll_right(c,S[1]);
                                System.out.println(String.valueOf(c));
                                }
                       //  System.out.println(String.valueOf(c));
                   }
                }               
