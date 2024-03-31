#include <stdio.h>
#include "mysql_hd.h"

int main()
{
    hello_name("hehe");
    return 0;
}

// Note:
// ---only on Windows---
// Every function needs to be exported to be able to access the functions by dart.
// Refer: https://stackoverflow.com/q/225432/8608146
void hello_world()
{
    printf("Hello World\n");
}

void hello_name(char* name)
{
    printf("Hello %s\n", name);
}