//
//  JLRouterTabBarViewController.h
//  JLRouterTest
//
//  Created by 刘冉 on 2018/2/24.
//  Copyright © 2018年 刘冉. All rights reserved.
//  JLRoutes 缺点：1. block块中 , 像push的下级传递参数问题  2. 传递参数为非框架中的类时 , 比如自定义模型
//           用处：1. 用于处理从网页跳转至app指定页面        2. 多个应用间的互相跳转

#import <UIKit/UIKit.h>
#import "JLRouterConfig.h"

@interface JLRouterTabBarViewController : UITabBarController

@end
