import java.util.*;
import java.io.*;
public class b {
 public static class Situation{
          private  String s;
          private  String move;
        public Situation(String s,String move){
                this.s= new String(s);
                this.move=new String(move);
                }
       }
  public static void Roll(char[] str,int i){
        char tmp1,tmp2,tmp3;
        if(i==1){
                tmp1=str[0];
                tmp2=str[3];
                str[0]=str[2];
                str[3]=tmp1;
                tmp3=str[5];
                str[5]=tmp2;
                str[2]=tmp3;
              }
          else if (i==2){
                tmp1=str[1];
                tmp2=str[4];
                tmp3=str[6];
                str[1]=str[3];
                str[4]=tmp1;
                str[6]=tmp2;
                str[3]=tmp3;
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
          }                   
  
  private static HashSet <String> newset = new HashSet <String>();
    public static void main(String[] args) throws Exception {
   // long startTime = System.currentTimeMillis();
           
           Scanner in=new Scanner(args[0]);
           String solution=new String();
           String sol=new String();
           String solved=new String("bgbGgGGrGyry");
           //Scanner in = new Scanner(System.in);
           char[] mySit=new char[13];
           solution = new String(in.nextLine());             
                // AdjList.clear();
             //System.out.println(solution);
                
                Situation st = new Situation(solution,new String());
                //System.out.println(st.move);
                Queue<Situation> q = new LinkedList<Situation>();
                q.offer(st);
           //     map.put(st.s,true);
                newset.add(st.s);
                while(!q.isEmpty()){
                         Situation u = q.poll();
                          
                         if((u.s).equals(solved)){
                              sol=u.move;
                              break;
                             
                           }   
                          else{
                                
                               for(int i=1;i<5;i++){
                                 mySit=(u.s).toCharArray();
                                      Roll(mySit,i);  
                                      //System.out.println(u.move);
                                        //Situation u_n=new Situation(String.valueOf(mySit),u.move+String.valueOf(i)); 
                                      // System.out.println(u_n.s+" "+u_n.move);
                                      if(!newset.contains(String.valueOf(mySit))){
                                                 
                                       q.offer(new Situation(String.valueOf(mySit),u.move+String.valueOf(i)));
                                       newset.add(String.valueOf(mySit));
                                       }
                  }
                 
         }                      
  }              
    System.out.println(sol);
 }
}                
