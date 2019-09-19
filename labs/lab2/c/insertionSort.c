// C template for bubble sort

#include <stdio.h>
#include <stdbool.h>

void insertionSort(char str[], int size);
void swap(char *a, char *b);
void printstray(char stray[], int size);

int main(void)
{
    char stray[6] = {'5', '3', '8', '1', '2', '9'};
    printstray(stray, 6);
    insertionSort(stray, 6);
    printstray(stray, 6);
    return 0;
}

// bubble sort a string
void insertionSort(char str[], int size)
{
    int i, key, j;
    for (i = 1; i < size; i++)
    {
        key = str[i];
        j = i - 1;

        while (j >= 0 && str[j] > key)
        {
            str[j + 1] = str[j];
            j = j - 1;
        }
        str[j + 1] = key;
    }
}

// swap value of memory locations
void swap(char *a, char *b)
{
    char tmp = *a;
    *a = *b;
    *b = tmp;
}

void printstray(char stray[], int size)
{
    printf("[");
    for (int i = 0; i < size; ++i)
    {
        printf(" %c,", stray[i]);
    }
    printf(" ]\n");
}