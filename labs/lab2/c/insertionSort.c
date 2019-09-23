// C template for bubble sort

#include <stdio.h>
#include <stdbool.h>

void insertionSort(char str[], int size);
void swap(char *a, char *b);
void printArray(char array[], int size);

int main(void)
{
    char array[6] = {'5', '3', '8', '1', '2', '9'};
    printstray(array, 6);
    insertionSort(array, 6);
    printstray(array, 6);
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

void printstray(char array[], int size)
{
    printf("[");
    for (int i = 0; i < size; ++i)
    {
        printf(" %c,", array[i]);
    }
    printf(" ]\n");
}