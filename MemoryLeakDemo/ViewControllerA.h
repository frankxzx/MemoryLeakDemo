//
//  ViewControllerA.h
//  MemoryLeakDemo
//
//  Created by Xuzixiang on 2018/5/30.
//  Copyright © 2018年 frankxzx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerA : UIViewController

@property(nonatomic, copy) void (^action)(void);

@end
