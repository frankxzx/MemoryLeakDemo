//
//  ViewController.m
//  MemoryLeakDemo
//
//  Created by Xuzixiang on 2018/5/30.
//  Copyright © 2018年 frankxzx. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerA.h"
#import <objc/runtime.h>

@interface ViewController ()

@property(nonatomic, copy) void (^action)(void);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSArray <NSString *>*methodNames = [ViewController enumrateMemoryLeakMethods];
//    [methodNames enumerateObjectsUsingBlock:^(NSString * _Nonnull methodName, NSUInteger idx, BOOL * _Nonnull stop) {
//        SEL action = NSSelectorFromString(methodName);
//        [self setUpButton:idx action:action];
//    }];

}

-(void)leak1 {
    __weak __typeof(self)weakSelf = self;
    self.action = ^ {
        weakSelf.view.backgroundColor = [UIColor yellowColor];
    };
}

-(void)leak2 {
    ViewControllerA *controller = [[ViewControllerA alloc]init];
//    [self presentViewController:controller animated:YES completion:^{
//        controller.view.backgroundColor = [UIColor brownColor];
//    }];
}

-(void)leak3 {
    ViewControllerA *controller = [[ViewControllerA alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
//    controller.action = ^{
//        self.view.backgroundColor = [UIColor whiteColor];
//    };
}

-(void)leak4 {
//    [[NSNotificationCenter defaultCenter]addObserverForName:UIScreenDidConnectNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
//
//    }];
}

-(void)leak5 {
    
}

-(void)setUpButton:(NSInteger)index action:(SEL)action {
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 50 * index + 20, 50, 100)];
    [button setTitle:[NSString stringWithFormat:@"内存泄露 %ld", (long)index+1] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

+ (NSArray <NSString *>*)enumrateMemoryLeakMethods {
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList(self, &methodCount);
    
    NSMutableArray *methodNames = [NSMutableArray array];
    for (unsigned int i = 0; i < methodCount; i++) {
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *methodName = NSStringFromSelector(selector);
        if ([methodName hasPrefix:@"leak"]) {
            [methodNames addObject:methodName];
        }
    }
    
    free(methods);
    return methodNames;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
