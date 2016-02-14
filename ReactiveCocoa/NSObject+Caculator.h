//
//  NSObject+Caculator.h
//  ReactiveCocoa
//
//  Created by 周文松 on 16/1/14.
//  Copyright © 2016年 TalkWeb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CaculatorMaker.h"

@class CaculatorMaker;
@interface NSObject (Caculator)

+ (int)makeCaculators:(void(^)(CaculatorMaker *make))caculatorMaker;
+ (BOOL)isEquel:(void (^)(CaculatorMaker *))caculatorMaker;

@end
