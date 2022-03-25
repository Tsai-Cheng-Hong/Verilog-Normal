/* Best path */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    int i,j;
    int w[5][5];          //map
    int a[25]={0};
    int check[26]={0};    //check repeat
    int sum=0;
    srand(time(NULL));
    /* check repeat */
    int k = 0;
    while(k<25)
    {
        a[k]=rand()%25+1;
        if(check[a[k]]==0)
        {
            check[a[k]]=1;
            k++;
        }
    }

    /* make map */
    for(i=0;i<5;i++)
    {
        for(j=0;j<5;j++)
        {
            w[i][j]=a[i*5+j];
            printf("%3d  ",w[i][j]);
        }
        printf("%\n");
    }printf("%\n");

    /* find best path */
    i=0,j=0;
    while(i<4 || j<4)
    {
        if(w[i][j+1]<w[i+1][j] && j<4)
        {
            printf("right %d\n",w[i][j+1]);
            sum=sum+w[i][j+1];
            j++;
        }
        else if(w[i][j+1]>w[i+1][j] && i<4)
        {
            printf("down %d\n",w[i+1][j]);
            sum=sum+w[i+1][j];
            i++;
        }
        else if(j==4)
        {
            printf("down %d\n",w[i+1][j]);
            sum=sum+w[i+1][j];
            i++;
        }
        else if(i==4)
        {
            printf("right %d\n",w[i][j+1]);
            sum=sum+w[i][j+1];
            j++;
        }
    }
    printf("Good job!");
    printf("\nstep: %d",sum-w[4][4]);
    return 0;
}

