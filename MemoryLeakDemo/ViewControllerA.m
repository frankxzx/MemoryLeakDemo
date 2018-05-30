//
//  ViewControllerA.m
//  MemoryLeakDemo
//
//  Created by Xuzixiang on 2018/5/30.
//  Copyright © 2018年 frankxzx. All rights reserved.
//

#import "ViewControllerA.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
//    if (self.action) {
//        self.action();
//    }
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 50, 100)];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)dismiss {
//    [self dismissViewControllerAnimated:YES completion:^{
//        self.presentedViewController.view.backgroundColor = [UIColor blackColor];
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
