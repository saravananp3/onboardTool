for(int j=0;j<i;j++)
       {
              if (sh[j].name.equals("bash"))
              {
                         level=sh[j].level;
                         seq=sh[j].seq_num;
                         sh[j].date="givendate";
                        int index=j;
                         System.out.println("seqqqqq "+seq+"Index:"+index);
                         level1=level;
                         System.out.println("Outer loop level1 : "+level1);
                         
                         for(int k=j-1;k>=0;k--)
                         {
                                    
                                    if (sh[k].level==level1-1)
                                    {
                                               break;
                                    }
                                    else if (sh[k].level==level1)
                                    {
                                               pln_st.add(sh[k].date);
                                               System.out.println("continue2  "+sh[k].date+sh[k].name);
                                               continue;
                                               
                                    }
                                   
                                    else
                                    {
                                               continue;
                                    }
                                  
                         }
                         
                                   for(int k=j+1;k<10000;k++)
                         {
                                    
                                    if (sh[k].level==level1+1)
                                    {
                                               break;
                                    }
                                    else if (sh[k].level==level1)
                                    {
                                               pln_st.add(sh[k].date);
                                               System.out.println("continue1  "+sh[k].date+sh[k].name);
                                               continue;
                                               
                                    }
                                   
                                    else
                                    {
                                               continue;
                                    }
                                  
                        
                         }