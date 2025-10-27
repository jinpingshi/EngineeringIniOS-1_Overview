//
//  HelloOC.m
//  Overview
//
//  Created by Jinping Shi on 2025/10/27.
//

#import "HelloOC.h"

@interface HelloOC ()
@property (nonatomic, strong, readwrite) NSString *message;
@end

@implementation HelloOC

- (instancetype)init {
    self = [super init];
    if (self) {
        _message = @"Hello World from Objective-C";
    }
    return self;
}

+ (NSString *)getHelloWorld {
    return @"Hello World from Objective-C (Class Method)";
}

- (NSString *)generateHelloWorld {
    return self.message;
}

- (void)printHelloWorld {
    NSLog(@"%@", self.message);
}

@end
