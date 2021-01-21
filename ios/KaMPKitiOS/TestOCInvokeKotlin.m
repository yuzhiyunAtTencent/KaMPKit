//
//  TestOCInvokeKotlin.m
//  KaMPKitiOS
//
//  Created by yuzhiyun on 2021/1/21.
//  Copyright © 2021 Touchlab. All rights reserved.
//

#import "TestOCInvokeKotlin.h"
#import <shared/shared.h>

@interface TestOCInvokeKotlin ()

@end

@implementation TestOCInvokeKotlin

- (void)invokeKotlinFun {
    NSLog(@"__________________________________invokeKotlinFun");
    
    SharedBreed *bread = [[SharedBreed alloc] initWithId:1222 name:@"myBread" favorite:1];
//    bread h
}

@end
