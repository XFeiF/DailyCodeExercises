//
//  AppDelegate.m
//  Homepwner
//
//  Created by XFeiF on 2016/11/21.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "AppDelegate.h"
#import "ItemsViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:
                   [[UIScreen mainScreen] bounds]];
    
    
    // 创建ItemsViewController对象
    ItemsViewController *itemsViewController = [[ItemsViewController alloc] init];
    self.window.rootViewController = itemsViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyWindow];
    return YES;
}
@end
