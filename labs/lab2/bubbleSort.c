// C template for bubble sort

#include <stdio.h>
#include <stdbool.h>

void bubbleSort(char str[], int size);
void swap(char *a, char *b);
void printArray(char array[], int size);

int main(void)
{
    char array[6] = {'5', '3', '8', '1', '2', '9'};
    printArray(array, 6);
    bubbleSort(array, 6);
    printArray(array, 6);
    return 0;
}

// bubble sort a string
void bubbleSort(char str[], int size)
{
    int i, j;
    for (i = 0; i < size - 1; i++)
    {
        // Last i elements are already in place
        for (j = 0; j < size - i - 1; j++)
        {
            if (str[j] > str[j + 1])
            {
                swap(&str[j], &str[j + 1]);
            }
        }
    }
}

// swap value of memory locations
void swap(char *a, char *b)
{
    char tmp = *a;
    *a = *b;
    *b = tmp;
}

void printArray(char array[], int size)
{
    printf("[");
    for (int i = 0; i < size; ++i)
    {
        printf(" %c,", array[i]);
    }
    printf(" ]\n");
}