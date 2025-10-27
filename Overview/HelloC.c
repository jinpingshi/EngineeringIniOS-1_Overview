//
//  HelloC.c
//  Overview
//
//  Created by Jinping Shi on 2025/10/27.
//

#include "HelloC.h"

static const char* helloMessage = "Hello World from C";

const char* getHelloWorldC(void) {
    return helloMessage;
}

void printHelloWorldC(void) {
    printf("%s\n", getHelloWorldC());
}
