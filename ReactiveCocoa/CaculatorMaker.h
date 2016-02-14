//
//  CaculatorMaker.h
//  ReactiveCocoa
//
//  Created by 周文松 on 16/1/14.
//  Copyright © 2016年 TalkWeb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaculatorMaker : NSObject
@property (nonatomic, assign) int result;
@property (nonatomic, assign) BOOL isEqule;
- (CaculatorMaker *(^)(int))add;
- (CaculatorMaker *(^)(int))sub;
- (CaculatorMaker *(^)(int))muilt;
- (CaculatorMaker *(^)(int))divide;

- (CaculatorMaker *)caculator:(int(^)(int result))caculator;
- (CaculatorMaker *)equle:(BOOL(^)(int result))operation;


@end
