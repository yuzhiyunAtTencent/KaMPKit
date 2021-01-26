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

- (void)testOc:(SharedNativeViewModel *)adapter {
    [self lostFrameStack:adapter];
    NSLog(@"s");
}

- (void)lostFrameStack:(SharedNativeViewModel *)adapter {
    SharedBreed *bread = [[SharedBreed alloc] initWithId:1222 name:@"myBread" favorite:1];
    [adapter updateBreedFavoriteBreed:bread];
}

@end
