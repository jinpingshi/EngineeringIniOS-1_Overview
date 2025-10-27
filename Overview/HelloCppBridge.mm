//
//  HelloCppBridge.m
//  Overview
//
//  Created by Jinping Shi on 2025/10/27.
//

#import "HelloCppBridge.h"
#include "HelloCpp.hpp"

@implementation HelloCppBridge

- (NSString *)getHelloWorldFromCpp {
    HelloCpp cpp;
    std::string cppString = cpp.getHelloWorld();
    return [NSString stringWithUTF8String:cppString.c_str()];
}

@end
