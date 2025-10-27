//
//  HelloWorld.c
//  Overview
//
//  Created by Jinping Shi on 2025/10/27.
//

// HelloWorld.c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

const char* getHelloWorldC(void) {
    static char message[] = "Hello World from C";
    return message;
}

char* createHelloWorldC(void) {
    char* str = (char*)malloc(20 * sizeof(char));
    strcpy(str, "Hello World from C");
    return str;
}
