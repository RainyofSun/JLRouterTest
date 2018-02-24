//
//  JLRouterTabBarViewController.m
//  JLRouterTest
//
//  Created by 刘冉 on 2018/2/24.
//  Copyright © 2018年 刘冉. All rights reserved.
//

#import "JLRouterTabBarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface JLRouterTabBarViewController ()

@end

@implementation JLRouterTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setVC];
}

- (void)setVC {
    
    OneViewController *one = [[OneViewController alloc] init];
    UINavigationController *oneNav = [[UINavigationController alloc] initWithRootViewController:one];
    one.title = @"第一个VC";
    
    TwoViewController *two = [[TwoViewController alloc] init];
    UINavigationController *twoNav = [[UINavigationController alloc] initWithRootViewController:two];
    two.title = @"第二个VC";
    
    ThreeViewController *three = [[ThreeViewController alloc] init];
    UINavigationController *threeNav = [[UINavigationController alloc] initWithRootViewController:three];
    three.title = @"第三个VC";
    
    // 注册模块跳转逻辑
    [self registerRouterWithANVC:oneNav scheme:@"JLRouterOne"];
    [self registerRouterWithBNVC:twoNav scheme:@"JLRouterTwo"];
    [self registerRouterWithCNVC:threeNav scheme:@"JLRouterThree"];
    
    self.viewControllers = @[oneNav,twoNav,threeNav];
    
}

/*
    注册跳转逻辑
 */
- (void)registerRouterWithANVC:(UINavigationController *)nvc scheme:(NSString *)scheme{
    
    __weak typeof(self) weakSelf = self;
    
    [[JLRoutes routesForScheme:scheme] addRoute:@"/:ViewController/:userID/:pass" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
     
        Class class = NSClassFromString(parameters[@"ViewController"]);
        NSLog(@"userid = %@",parameters[@"userID"]);
        NSLog(@"pass = %@",parameters[@"pass"]);
        
        [nvc pushViewController:[[class alloc] init] animated:YES];
        
        weakSelf.selectedIndex = 0;
        return YES;
    }];
}

- (void)registerRouterWithBNVC:(UINavigationController *)nvc scheme:(NSString *)scheme {
    
    __weak typeof(self) weakSelf = self;
    
    [[JLRoutes routesForScheme:scheme] addRoute:@"/:ViewControllerTwo" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        Class class = NSClassFromString(parameters[@"ViewControllerTwo"]);
        
        [nvc pushViewController:[[class alloc] init] animated:YES];
        
        weakSelf.selectedIndex = 1;
        return YES;
    }];
}

- (void)registerRouterWithCNVC:(UINavigationController *)nvc scheme:(NSString *)scheme {
    
    __weak typeof(self) weakSelf = self;
    
    [[JLRoutes routesForScheme:scheme] addRoute:@"/:ViewControllerThree" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        Class class = NSClassFromString(parameters[@"ViewControllerThree"]);
        
        [nvc pushViewController:[[class alloc] init] animated:YES];
        
        weakSelf.selectedIndex = 2;
        
        return YES;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
