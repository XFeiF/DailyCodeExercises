//
//  AppDelegate.m
//  HypnoNerd
//
//  Created by XFeiF on 2016/11/20.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ReminderViewController.h"
#import "QuizViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];
    
    ViewController *vc = [[ViewController alloc]init];
    
    ReminderViewController *rvc = [[ReminderViewController alloc]init];
    QuizViewController *qvc = [[QuizViewController alloc]init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[vc, rvc, qvc];
    
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyWindow];
    return YES;
}



@end
