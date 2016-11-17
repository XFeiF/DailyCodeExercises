//
//  AppDelegate.m
//  Hypnosister
//
//  Created by XFeiF on 2016/11/17.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen]bounds]];
    
    ViewController *controller = [[ViewController alloc] init];
    [self.window setRootViewController:controller];
    
    
    //CGRect firstFrame = CGRectMake(160, 240, 100, 150);
    CGRect firstFrame = self.window.bounds;
    
    HypnosisView *firstView = [[HypnosisView alloc]
                               initWithFrame:firstFrame];
    
    //firstView.backgroundColor = [UIColor redColor];
    
    [self.window addSubview:firstView];
    
    
    /*
     
    CGRect secondFrame = CGRectMake(20, 30, 50, 50);
    
    HypnosisView *secondView = [[HypnosisView alloc]
                               initWithFrame:secondFrame];
    
    secondView.backgroundColor = [UIColor blueColor];
    
    //[self.window addSubview:secondView];
    
    [firstView addSubview:secondView];
     
     */
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
