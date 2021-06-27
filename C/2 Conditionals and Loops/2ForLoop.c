#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() 
{
    int a, b;
    scanf("%d\n%d", &a, &b);
  	// Complete the code.
    char* figures[] = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"};
    for (int i=a; i<=b; i++) {
        if (i < 10) 
            printf("%s", figures[i - 1]);
        else if (i % 2 == 0)
            printf("even");
        else
            printf("odd");
        printf("\n");
    }
    return 0;
}

