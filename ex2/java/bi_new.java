import java.util.*;
import java.io.*;

public class bi_new {

 public static class Situation{
          private  String s;
          private  String move;
        public Situation(String s,String move){
                this.s= new String(s);
                this.move=new String(move);
                }
       }
  public static void Roll_right(char[] str,int i){
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
  public static void Roll_left (char[] str,int i){
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
         }  
        private static  Map<String,String> mleft = new HashMap<String,String>();
       private static Map<String,String> mright = new HashMap<String,String>();
  public static String printPath(String sol_r,String sol_right,String sol_l,String sol_left,String root_right,String root_left){        
              char[] mySit = new char[13];          
             if(sol_right.isEmpty()){
                        //String r_=new String("bgbGgGGrGyry");
                        String m=new String(sol_left); 
                        sol_r= new String(sol_l); 
                        
                        //System.out.println(sol_r);  
                        while(!sol_r.equals(root_right)){
                                String parent=new String(sol_r);
                                sol_r=mright.get(sol_r);
                 //               System.out.println(sol_r);
                   //             if(sol_r.equals(root_right)) break; 
                                for(int i=1;i<5;i++){ 
                                         mySit=parent.toCharArray();         
                                        Roll_left(mySit,i);
                                         
                                        if(sol_r.equals(String.valueOf(mySit))){ m=String.valueOf(i)+m; break;}
                                  } 
                     }
                    return m;            
                               
                 } 
               else {
                   //  sol_left=new String(root_left);
                        String m=new String(sol_right);     
                        sol_l=new String(sol_r);
                        //System.out.println(sol_r); 
                       // System.out.println(root_left);  
                       while(!sol_l.equals(root_left)){
                                String parent =new String(sol_l);
                                
                                sol_l=mleft.get(sol_l);
                                 //System.out.println(m); 
                                
                                for(int i=1;i<5;i++){
                                mySit=parent.toCharArray(); 
                                        Roll_right(mySit,i);
                                        
                                     //  System.out.println(String.valueOf(mySit));
                                 //       System.out.println(sol_l);
                                        if(sol_l.equals(String.valueOf(mySit))){m=m+String.valueOf(i); break;}
                                  }
                              } 
               return m;
               }             
             }       
  //private static HashSet <String> visited_left = new HashSet <String>();
  //private static HashSet <String> visited_right = new HashSet <String> (); 
   public static void main(String[] args) throws Exception {
        Scanner in=new Scanner(args[0]);
        char[] mySit=new char[13];
       
        String root_left=new String("bgbGgGGrGyry");
        //mleft.put(new String("bgbGgGGrGyry"),new String());
        String root_right =new String(in.nextLine());
         String sol_l =new String();
        String sol_r = new String();
        mright.put(sol_r,root_right);
         mleft.put(sol_l,new String("bgbGgGGrGyry"));
        //mright.put(root_right,new String());
        String end_left=root_right;
        String end_right=root_left;
        String sol_left=new String();
        String sol_right=new String();
          Queue<Situation> q_left = new LinkedList<Situation>();
         Queue<Situation> q_right = new LinkedList<Situation>();
        Situation start_left=new Situation(root_left,sol_l);
        Situation start_right = new Situation(root_right,sol_r);
        q_left.offer(start_left);q_right.offer(start_right);
       //  System.out.println(start_right.s);
        //visited_left.add(root_left);
        //visited_right.add(root_right);
        boolean found=false;
        while ((!q_left.isEmpty())&&(!q_right.isEmpty())){
                    Situation u1=q_left.poll();
                    Situation u2=q_right.poll();
                  //  System.out.println(u1.s);
                        if((u1.s).equals(end_left)){
                              sol_left=u1.move;
                              sol_l=u1.s;
                              q_left.clear();
                              found=true;
                              break;}
                        else if((u2.s).equals(end_right)){
                                sol_right=u2.move;
                                sol_r=u2.s;
                                q_right.clear();
                                found=true; 
                                break;  
                              }  
                         else{
                                if(mright.containsKey(u1.s)) {
                                        sol_left=u1.move;
                                          sol_l=new String(u1.s);
                                          q_left.clear();
                                          break;
                                          }
                                else if(mleft.containsKey(u2.s)){ 
                                        sol_right=u2.move;
                                          sol_r=new String(u2.s);
                                          q_right.clear();
                                          break;
                                          }          
                               else{           
                               for(int i=1;i<5;i++){
                                      // System.out.println(u1.s);
                                       mySit=(u1.s).toCharArray(); 
                                      Roll_left(mySit,i);  
                                       if(!mleft.containsKey(String.valueOf(mySit))){
                                          q_left.offer(new Situation(String.valueOf(mySit),String.valueOf(i)+u1.move));
                                          mleft.put(new String(String.valueOf(mySit)),u1.s);
                                      // mleft.put(u1.s,new String(String.valueOf(mySit)));
                                       //visited_left.add(String.valueOf(mySit));
                                       }  
                                     }
                                   
                                
                                          
                                 for(int i=1;i<5;i++){
                                        mySit=(u2.s).toCharArray();
                                      Roll_right(mySit,i);                 
                                      if(!mright.containsKey(String.valueOf(mySit))){
                                         
                                            
                                                 //System.out.println("bfs right:"+String.valueOf(mySit));
                                       q_right.offer(new Situation(String.valueOf(mySit),u2.move+String.valueOf(i)));
                                      mright.put(new String(String.valueOf(mySit)),u2.s);
                                     // mright.put(u2.s,new String(String.valueOf(mySit)));
                                       //visited_right.add(String.valueOf(mySit));
                                       }  }
                                    
                                    }
                                   } 
                               }
                           
                            
                        System.out.println(printPath(sol_r,sol_right,sol_l,sol_left,root_right,root_left));
                         //System.out.println(printPath(sol_r,sol_right,sol_l,sol_left,root_right,root_left).length());
                         
                         
                                
           }            
     
          }  