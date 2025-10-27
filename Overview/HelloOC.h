//
//  HelloOC.h
//  Overview
//
//  Created by Jinping Shi on 2025/10/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HelloOC : NSObject

@property (nonatomic, strong, readonly) NSString *message;

+ (NSString *)getHelloWorld;

- (instancetype)init;
- (NSString *)generateHelloWorld;
- (void)printHelloWorld;

@end

NS_ASSUME_NONNULL_END
