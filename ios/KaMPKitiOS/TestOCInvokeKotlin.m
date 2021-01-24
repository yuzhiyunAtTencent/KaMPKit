//
//  TestOCInvokeKotlin.m
//  KaMPKitiOS
//
//  Created by yuzhiyun on 2021/1/21.
//  Copyright © 2021 Touchlab. All rights reserved.
//

#import "TestOCInvokeKotlin.h"
#import <shared/shared.h>

@protocol TestOCProtocol <NSObject>

- (void)testFun:(SharedNativeViewModel *)adapter;

@end

@interface TestOCInvokeKotlin () <TestOCProtocol>

@end

@implementation TestOCInvokeKotlin

- (void)lostFrameStack:(SharedNativeViewModel *)adapter {
    [self real1:adapter];
}

- (void)real1:(SharedNativeViewModel *)adapter {
    [self real2:adapter];
}

- (void)real2:(SharedNativeViewModel *)adapter {
    [self real3:adapter];
}

- (void)real3:(SharedNativeViewModel *)adapter {
    [self testFun:adapter];
}

- (void)testFun:(SharedNativeViewModel *)adapter {
    NSLog(@"s");
    SharedBreed *bread = [[SharedBreed alloc] initWithId:1222 name:@"myBread" favorite:1];
    [adapter updateBreedFavoriteBreed:bread];
}

@end
