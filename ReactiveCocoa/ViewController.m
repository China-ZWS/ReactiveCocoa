//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by 周文松 on 16/1/14.
//  Copyright © 2016年 TalkWeb. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Caculator.h"

@interface ViewController ()
@property (nonatomic, strong) RACSubject *delegateSignal;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) RACCommand *conmmand ;
- (IBAction)zhou:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    int result = [NSObject makeCaculators:^(CaculatorMaker *mgr)
                  {
                      mgr.add(1).add(5);
                
                  }];
    NSLog(@"result == %d",result);
    
    BOOL isEquel = [NSObject isEquel:^(CaculatorMaker *mgr)
                    {
                        [[[mgr caculator:^int(int result)
                           {
                               result +=3;
                               result *= 5;
                               
                               return result;
                           }] equle:^BOOL(int result)
                          {
                              
                              return result == 15;
                          }] isEqule];                        
                    }];
    NSLog(@"isEquel = %d",isEquel);
    
    
    
    
    self.delegateSignal = [RACSubject subject];
    
    // 订阅代理信号
    [self.delegateSignal subscribeNext:^(id x) {
        
        NSLog(@"点击了通知按钮");
    }];

    
#if 0

    // 1.遍历数组
    NSArray *numbers = @[@1,@2,@3,@4];
    
    // 这里其实是三步
    // 第一步: 把数组转换成集合RACSequence numbers.rac_sequence
    // 第二步: 把集合RACSequence转换RACSignal信号类,numbers.rac_sequence.signal
    // 第三步: 订阅信号，激活信号，会自动把集合中的所有值，遍历出来。
    [numbers.rac_sequence.signal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];

    
    // 2.遍历字典,遍历出来的键值对会包装成RACTuple(元组对象)
    NSDictionary *dict = @{@"name":@"xmg",@"age":@18};
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {
        
        // 解包元组，会把元组的值，按顺序给参数里面的变量赋值
        RACTupleUnpack(NSString *key,NSString *value) = x;
        
        // 相当于以下写法
        //        NSString *key = x[0];
        //        NSString *value = x[1];
        
        NSLog(@"%@ %@",key,value);
        
    }];
    
    
    // 5.监听文本框的文字改变
    [_textField.rac_textSignal subscribeNext:^(id x) {
        
        NSLog(@"文字改变了%@",x);
    }];

    
    
    
    
//    
//    
//    
//    // 1.创建命令
//    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
//        
//        
//        NSLog(@"执行命令");
//        
//        // 创建空信号,必须返回信号
//        //        return [RACSignal empty];
//        
//        // 2.创建信号,用来传递数据
//        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//            
//            [subscriber sendNext:@"请求数据"];
//            
//            // 注意：数据传递完，最好调用sendCompleted，这时命令才执行完毕。
//            [subscriber sendCompleted];
//            
//            return nil;
//        }];
//        
//    }];
//    
//    // 强引用命令，不要被销毁，否则接收不到数据
//    _conmmand = command;
//    
//    
//    
//    // 3.订阅RACCommand中的信号
//    [command.executionSignals subscribeNext:^(id x) {
//        
//        [x subscribeNext:^(id x) {
//            
//            NSLog(@"%@",x);
//        }];
//        
//    }];
//    
//    // RAC高级用法
//    // switchToLatest:用于signal of signals，获取signal of signals发出的最新信号,也就是可以直接拿到RACCommand中的信号
//    [command.executionSignals.switchToLatest subscribeNext:^(id x) {
//        
//        NSLog(@"%@",x);
//    }];
//    
//    // 4.监听命令是否执行完毕,默认会来一次，可以直接跳过，skip表示跳过第一次信号。
//    [[command.executing skip:1] subscribeNext:^(id x) {
//        
//        if ([x boolValue] == YES) {
//            // 正在执行
//            NSLog(@"正在执行");
//            
//        }else{
//            // 执行完成
//            NSLog(@"执行完成");
//        }
//    }];
//    // 5.执行命令
//    [self.conmmand execute:@1];
//
//    

    
    
    
    // 需求：假设在一个信号中发送请求，每次订阅一次都会发送请求，这样就会导致多次请求。
    // 解决：使用RACMulticastConnection就能解决.
//    
//    // 1.创建请求信号
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        
//        
//        NSLog(@"发送请求");
//        
//        return nil;
//    }];
//    // 2.订阅信号
//    [signal subscribeNext:^(id x) {
//        
//        NSLog(@"接收数据");
//        
//    }];
//    // 2.订阅信号
//    [signal subscribeNext:^(id x) {
//        
//        NSLog(@"接收数据");
//        
//    }];
//    
    // 3.运行结果，会执行两遍发送请求，也就是每次订阅都会发送一次请求
    
#endif
}

- (IBAction)zhou:(id)sender;
{
    // 通知代理
    // 判断代理信号是否有值
    if (self.delegateSignal) {
        // 有值，才需要通知
        [self.delegateSignal sendNext:nil];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
