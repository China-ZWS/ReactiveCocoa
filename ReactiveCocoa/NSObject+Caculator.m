//
//  NSObject+Caculator.m
//  ReactiveCocoa
//
//  Created by 周文松 on 16/1/14.
//  Copyright © 2016年 TalkWeb. All rights reserved.
//

#import "NSObject+Caculator.h"

@implementation NSObject (Caculator)

+ (int)makeCaculators:(void (^)(CaculatorMaker *))caculatorMaker
{
    CaculatorMaker *mgr = [CaculatorMaker new];
    caculatorMaker(mgr);
    return mgr.result;
}


+ (BOOL)isEquel:(void (^)(CaculatorMaker *))caculatorMaker
{
    CaculatorMaker *mgr = [CaculatorMaker new];
    caculatorMaker(mgr);
      return mgr.isEqule;
}

@end
