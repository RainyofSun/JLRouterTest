//
//  AppDelegate.m
//  JLRouterTest
//
//  Created by 刘冉 on 2018/2/24.
//  Copyright © 2018年 刘冉. All rights reserved.
//

#import "AppDelegate.h"
#import "JLRouterTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[JLRouterTabBarViewController alloc] init];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - openUrl方法   在此处对所有的跳转进行拦截 , 手动解析处理 , 再交于JLRoutes
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSString *str   = url.absoluteString;
    NSArray *arr    = [str componentsSeparatedByString:@"://"];
    
    if ([[arr.firstObject lowercaseString] isEqualToString:@"jlrouterone"]) {
        return [[JLRoutes routesForScheme:@"JLRouterOne"] routeURL:url];
    } else if ([[arr.firstObject lowercaseString] isEqualToString:@"jlroutertwo"]) {
        return [[JLRoutes routesForScheme:@"JLRouterTwo"] routeURL:url];
    } else {
        return [[JLRoutes routesForScheme:@"JLRouterThree"] routeURL:url];
    }
}


@end
