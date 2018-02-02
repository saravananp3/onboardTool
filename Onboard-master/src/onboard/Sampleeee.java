package onboard;
import java.util.*;

public class Sampleeee {
public static void main(String ar[]){
	Scanner s=new Scanner(System.in);
	System.out.println("enter");
	int n=s.nextInt();
	System.out.println("enter the elements");
	int a[]=new int[n+1];
	int max=0,m1=0,t,num=0,cnt=0,choice=0,z=1;
	for(int i=0;i<n;i++)
		a[i]=s.nextInt();
	
	int count[][]=new int[n][5];
	
	count[0][0]=a[0];
	count[0][1]++;
	int j;
	for(int i=1;i<n;i++)
	{
		int e=0;
		for(j=0;j<z;j++){
			if(a[i]==count[j][0]){
				count[j][1]++;
				e++;
				break;
			}
		}
		if(e==0)
		{
			count[j][0]=a[i];
			count[j][1]++;
			z++;
		}
	}

	
	for(int i=0;i<z;i++)
	{
		for(j=i+1;j<z;j++)
		{
			if(count[i][1]<count[j][1])
			{
				t=count[i][1];
				count[i][1]=count[j][1];
				count[j][1]=t;

				t=count[i][0];
				count[i][0]=count[j][0];
				count[j][0]=t;
			}
			else if(count[i][1]==count[j][1])
			{
				if(count[i][0]>count[j][0])
				{
					t=count[i][0];
					count[i][0]=count[j][0];
					count[j][0]=t;
				}
			}
			
		}
	}
	
	System.out.println("----------------------");
	for(int i=0;i<z;i++)
		System.out.println(count[i][0]+" "+count[i][1]);
	
	for(j=0;j<z;j++){
	for(int i=0;i<n;i++)
	{
	if(a[i]==count[j][0])
		{
			t=a[i];
			for(int k=i;k>cnt;k--)
				a[k]=a[k-1];
			a[cnt]=t;
			cnt++;
		}
		
	}}

	System.out.println("------------");
	for(int i=0;i<n;i++)
	 System.out.print(a[i]);
	
}
}