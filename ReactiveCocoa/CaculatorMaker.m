//
//  CaculatorMaker.m
//  ReactiveCocoa
//
//  Created by 周文松 on 16/1/14.
//  Copyright © 2016年 TalkWeb. All rights reserved.
//

#import "CaculatorMaker.h"

@implementation CaculatorMaker

- (CaculatorMaker *(^)(int))add;
{
   
    return ^CaculatorMaker *(int value)
    {
        _result += value;
        return self;
    };
}

- (CaculatorMaker *)equle:(BOOL(^)(int result))operation;
{
    
    _isEqule = operation(_result);
    return self;
}
- (CaculatorMaker *)caculator:(int(^)(int result))caculator;
{
    _result = caculator(_result);
    
    return self;
}
@end
