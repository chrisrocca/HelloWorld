#include <stdio.h>
#include <stdlib.h>
#include "helloWorld.h"

int main(int argc, char *argv[])
{
    printArgs(argc, argv);
    printMsg("Hello World");
    printMsg("We are on the feature/addMessages branch");
    return EXIT_SUCCESS;
}

void printArgs(int argc, char *argv[])
{
    for (int i=0; i<argc; i++) {
        printf("arg[%d] : %s\n", i, argv[i]);
    }
}

void printMsg(char* msg)
{
    printf("%s\n", msg);
}

