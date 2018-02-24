//
//  OneViewController.m
//  JLRouterTest
//
//  Created by 刘冉 on 2018/2/24.
//  Copyright © 2018年 刘冉. All rights reserved.
//

#import "OneViewController.h"
#import "JLRouterConfig.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
}

- (void)setUI {
    UIButton *btn       = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btn.frame           = CGRectMake(100, 100, 80, 80);
    [btn addTarget:self action:@selector(moveNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)moveNext {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"JLRouterOne://OneNextViewController/123456/kkkkkkk"] options:nil completionHandler:nil];
    
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
